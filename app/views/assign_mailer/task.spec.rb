require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    user_a = FactoryBot.create(:user)
    visit login_path
    fill_in 'メールアドレス', with: 'sample@example.com'
    fill_in 'パスワード', with: '00000000'
    click_on 'ログインする'
    task_a = FactoryBot.create(:task, task_name: 'task', user:user_a)
    task_b = FactoryBot.create(:second_task, task_name: 'new_task', user:user_a)
  end
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示される' do
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
    context '複数のタスクを作成した場合' do
      it 'タスクが作成日時の降順に並んでいる' do
        visit tasks_path
        task_list = all('tbody tr')

        expect(task_list[0]).to have_content 'new_task'
        expect(task_list[1]).to have_content 'task'
      end
    end
  end
end
