RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  # == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.parent_controller = '::ApplicationController'

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show do
      except [Order]
    end
    edit
    delete
    show_in_app

    member :tracking_order do
      i18n_key :tracking_order
      authorization_key :tracking_order
      only [Order]
      http_methods { [:post, :get] }
      controller do
        proc do
          if request.post?
            @object.status = params[:status]
            @object.save!
            redirect_to index_path(model_name: 'order')
          end
        end
      end
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Product do
    edit do
      field :title
      field :description
      field :image
      field :price_cents do
        help 'Coloque o preço em centavos, por exemplo: 1000 significa R$ 10,00'
      end
      field :ingredient_groups
      field :restaurant_id, :hidden do
        default_value do
          bindings[:view]._current_user.restaurant_id
        end
      end
    end

    list do
      field :title
      field :description
      field :image
      field :price_cents do
        formatted_value do
          humanized_money_with_symbol value
        end
      end
    end

    show do
      field :title
      field :description
      field :image
      field :price do
        formatted_value do
          humanized_money_with_symbol value
        end
      end
    end

    export do
      field :title
      field :description
      field :price_cents do
        formatted_value do
          humanized_money_with_symbol value
        end
      end
    end
  end
end
