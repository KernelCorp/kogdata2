class @UserTypeSwitcher



  constructor: ->
    @customerButton   = $ 'button.client-option'
    @contractorButton = $ 'button.contractor-option'
    @typeInput        = $ 'input#user_type'
    @customerButton.on   'click', @customerButtonOnClickHandler
    @contractorButton.on 'click', @contractorButtonOnClickHandler


  customerButtonOnClickHandler: () =>
    @doIfNotActive @customerButton, =>
      @customerButton.addClass 'active'
      @contractorButton.removeClass 'active'
      @typeInput.val('Customer')


  contractorButtonOnClickHandler: () =>
    @doIfNotActive @contractorButton, =>
      @contractorButton.addClass 'active'
      @customerButton.removeClass 'active'
      @typeInput.val 'Photographer'

  doIfNotActive: (button, block) =>
    do block unless button.hasClass('active')


