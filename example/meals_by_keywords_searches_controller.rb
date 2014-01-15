##
 # @apiDefineSuccessStructure RecipeSearchByKeywords
 # @apiVersion 1.0.0
 # 
 # @apiSuccessExample  Response (example):
 #     HTTP/1.1 200 Ok
 #     {
 #   	"page_size": 2,
 #  	"page_number": 1,
 #   	"term": "chicken sandwich",
#     	"total_records": 2,
#     	"order_by": null,
#     	"order_direction": "desc",
#     	"meals": [
#         {
#             "id": 14397,
#             "user_id": null,
#             "name": "Chicken Sandwich",
#             "prep_time": 5,
#             "serving_size": 2,
#             "is_favorite": false,
#             "needs_attention": false,
#             "external_id": "FAHR:14915",
#             "user_meal_favorite": {
#                 "id": null
#             },
#             "recipe_nutrients": [
#                 {
#                     "amount": 309,
#                     "nutrient": {
#                         "id": 4,
#                         "name": "Calories"
#                     }
#                 },
#                 {
#                     "amount": 30,
#                     "nutrient": {
#                         "id": 6,
#                         "name": "Total Carbohydrate"
#                     }
#                 }
#             ],
#             "href": "/api/v1/meals/14397"
#         },
#         {
#             "id": 13995,
#             "user_id": null,
#             "name": "Chicken and Soy Salad Sandwich",
#             "prep_time": 10,
#             "serving_size": 6,
#             "is_favorite": false,
#             "needs_attention": false,
#             "external_id": "ER:14462",
#             "user_meal_favorite": {
#                 "id": null
#             },
#             "recipe_nutrients": [
#                 {
#                     "amount": 28,
#                     "nutrient": {
#                         "id": 6,
#                         "name": "Total Carbohydrate"
#                     }
#                 },
#                 {
#                     "amount": 279,
#                     "nutrient": {
#                         "id": 4,
#                         "name": "Calories"
#                     }
#                 }
#             ],
#             "href": "/api/v1/meals/13995"
#         }
#     ],
#     "errors": {}
# }
##

##
 # @apiDefineErrorStructure RecipeSearchByKeywords
 # @apiVersion 1.0.0
 # 
 # @apiError NoAccessRight Only authenticated Admins can access the data.
 # @apiError UserNameTooShort Minimum of 5 characters required.
 # 
 # @apiErrorExample  Response (example):
 #     HTTP/1.1 400 Bad Request
 #     {
 #       "error": "UserNameTooShort"
 #     }
##

##
 # @api {post} /api/v1/search/meals_by_keywords Recipe Search by Keywords
 # @apiVersion 1.0.0
 # @apiGroup Recipe Search
 # @apiName RecipeSearchByKeywords
 #
 # @apiDescription Search for recipes by keyword.
 # 
 # Despite the name of the feature being "recipe" search, the objects being returned are "meals".
 #
 # Search terms should be space separated words such as corn chowder, chicken, or chicken pasta.
 #
 # The search performs an "and" query so meals that show up must have all keywords entered in the term.
 #
 # 
 # @apiParam {String} term Search Term.
 # @apiParam {String} [page_size=10] Page Size.
 # @apiParam {String} [page_number=1] Page Number.
 # @apiParam {String} order_by Order By
 # @apiParam {String} order_direction Order Direction
 #
 # @apiSuccess {String} term Search Term.
 # @apiSuccess {String} page_size Page Size.
 # @apiSuccess {String} page_number Page Number.
 # @apiSuccess {String} page_size Maximun number of results
 # @apiSuccess {String} order_by Order By
 # @apiSuccess {String} order_direction Order Direction
 # @apiSuccess {Meal[]} meals Meals Results
 #
 # @apiErrorStructure RecipeSearchByKeywords
 # @apiSuccessStructure RecipeSearchByKeywords
 ##



 class MealsByKeywordsSearchesController < AbstractMealsSearchesController
  before_filter :require_api_user_or_cobrand

  def index
    super
  end

  protected

  def search_broker
    MealsByKeywordsSearchBroker.new(user, cobrand, params)
  end
end
