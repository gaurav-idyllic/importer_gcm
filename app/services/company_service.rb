class CompanyService < BaseService
  def get_data(params, page)
    condition = ''
    category_ids = []
    filter_text = params[:filter_text]
    if filter_text.present?
      condition = "status like '%#{filter_text}%' OR invoice_num like '%#{filter_text}%' OR reporter like '%#{filter_text}%' OR categories.name like '%#{filter_text}%'"
    end
    Company.joins(:categories).where(company: params[:name]).where(condition).page(page).uniq
  end
end
