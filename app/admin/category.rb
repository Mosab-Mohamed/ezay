ActiveAdmin.register Category , as: "Departments" do



controller do
    def permitted_params
      params.permit category: [:name, :title]
    end
  end

end
