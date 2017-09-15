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

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Product do
    edit do
      field :title
      field :description
      field :image
      field :price
      field :ingredients
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
      field :price do
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
      field :price do
        formatted_value do
          humanized_money_with_symbol value
        end
      end
    end
  end
end
