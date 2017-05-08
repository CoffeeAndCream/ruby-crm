ActiveAdmin.register_page "Dashboard" do

 menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do

      column do
        panel "Recent Leads" do
          table_for Lead.order('created_at desc').limit(10) do
            column("Name")   {|lead| link_to lead.fullname, admin_lead_path(lead)                                  }
            column("Phone"){|lead| lead.phone }
            column("Address")   {|lead| lead.address                       }
            column("Salesperson")   {|lead| unless lead.user.nil?
              lead.user.fullname
            end
            }
          end
        end
      end
      column do
        panel "Recent Projects" do
          table_for Lead.where(:begin_project => true).order('created_at desc').limit(10) do
            column("Name")   {|lead| link_to lead.fullname, lead_project_path(lead, lead.id, lead.project)      }
            column("Phone"){|lead| lead.phone }
            column("Address")   {|lead| lead.address                       }
            column("Project ID")   {|lead| unless lead.project.nil?
              lead.project
            end                   }
            column("# of Tasks")   {|lead| unless lead.project.nil?
              lead.project.tasks.count
            end         }
          end
        end
      end
    end
    end # columns
end
