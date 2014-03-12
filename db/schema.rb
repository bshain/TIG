# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140311001719) do

  create_table "Countries", primary_key: "CountryID", force: true do |t|
    t.string  "CountryName",    limit: 64,  default: "",    null: false
    t.string  "CNinLang",                   default: "",    null: false
    t.string  "CIACountryName", limit: 200, default: "",    null: false
    t.string  "CountryAbbr",    limit: 2,   default: "",    null: false
    t.string  "ISO3166",        limit: 2,   default: "",    null: false
    t.integer "RegionID"
    t.integer "CountryCPS"
    t.string  "CountrySC",      limit: 20
    t.string  "Colors",         limit: 10,  default: "",    null: false
    t.string  "SiteName",       limit: 64,  default: "",    null: false
    t.string  "SiteSubdomain",  limit: 64,  default: "",    null: false
    t.boolean "flFeatured",                 default: false, null: false
    t.boolean "flStateProvMap",             default: false, null: false
    t.boolean "flTerritory",                default: false, null: false
    t.text    "TerritoryInfo",                              null: false
    t.boolean "flSmallIsland",              default: false, null: false
    t.boolean "flUnpopulated",              default: false, null: false
    t.integer "flLDC",          limit: 1,                   null: false
    t.integer "DefaultLangID",              default: 0,     null: false
    t.float   "ActiveRate",     limit: 4,   default: 0.0,   null: false
    t.string  "ActiveMetrics",  limit: 128, default: "",    null: false
    t.string  "GYSDURL",        limit: 128, default: "",    null: false
    t.string  "OfficialURL",                default: "",    null: false
    t.integer "nUsers"
    t.integer "nMemberStories"
    t.integer "nBlogPosts"
    t.integer "nOrgs"
    t.integer "nEvents"
    t.integer "nOpps"
    t.integer "nProjects"
    t.integer "nArticles"
    t.integer "nGGSubmissions"
    t.integer "nSchools",                                   null: false
    t.integer "nTeachers",                                  null: false
    t.string  "MiddleLat",      limit: 7,   default: "",    null: false
    t.string  "MiddleLong",     limit: 7,   default: "",    null: false
  end

  add_index "countries", ["CountryName"], name: "CountryName", unique: true, using: :btree
  add_index "countries", ["ISO3166"], name: "ISO3166", using: :btree
  add_index "countries", ["RegionID"], name: "RegionID", using: :btree
  add_index "countries", ["SiteSubdomain", "ISO3166"], name: "SiteSubdomain", using: :btree
  add_index "countries", ["flLDC"], name: "flLDC", using: :btree
  add_index "countries", ["nUsers"], name: "nUsers", using: :btree

  create_table "CountriesRegions", primary_key: "ID", force: true do |t|
    t.integer "CountryID", default: 0, null: false
    t.integer "RegionID",  default: 0, null: false
  end

  add_index "countriesregions", ["CountryID"], name: "CountryID", using: :btree
  add_index "countriesregions", ["RegionID", "CountryID"], name: "RegionID", using: :btree

  create_table "Regions", id: false, force: true do |t|
    t.integer "RegionID",    limit: 1,               null: false
    t.string  "RegionName",  limit: 60, default: "", null: false
    t.string  "Subdomain",   limit: 64,              null: false
    t.string  "ColorCode",   limit: 6,               null: false
    t.text    "Description",                         null: false
  end

  add_index "regions", ["RegionID"], name: "RegionID_2", unique: true, using: :btree
  add_index "regions", ["Subdomain"], name: "Subdomain", using: :btree

  create_table "UpdatesFR", primary_key: "FRID", force: true do |t|
    t.integer   "MemberID",              default: 0, null: false
    t.integer   "FriendID"
    t.string    "FriendAlias"
    t.integer   "LinkType",    limit: 2, default: 1, null: false
    t.string    "LinkURL"
    t.integer   "flMutual",    limit: 1,             null: false
    t.timestamp "Stamp",                             null: false
  end

  add_index "updatesfr", ["FriendID"], name: "FriendID", using: :btree
  add_index "updatesfr", ["MemberID", "FriendID"], name: "Both", using: :btree
  add_index "updatesfr", ["Stamp"], name: "Stamp", using: :btree
  add_index "updatesfr", ["flMutual"], name: "flMutual", using: :btree

  create_table "UserInspired", primary_key: "ID", force: true do |t|
    t.integer   "MemberID",         null: false
    t.integer   "InspiredMemberID", null: false
    t.timestamp "Stamp",            null: false
  end

  add_index "userinspired", ["InspiredMemberID"], name: "InspiredMemberID", using: :btree
  add_index "userinspired", ["MemberID"], name: "MemberID", using: :btree

  create_table "Users", id: false, force: true do |t|
    t.integer   "UserID",                  limit: 3,                                   null: false
    t.string    "Name",                                default: "",                    null: false
    t.string    "DisplayName",                         default: "",                    null: false
    t.boolean   "UserTypeID",                          default: false,                 null: false
    t.integer   "CountryID",               limit: 2,   default: 0,                     null: false
    t.integer   "CountryBornID",           limit: 2,   default: 0,                     null: false
    t.integer   "Age",                     limit: 2
    t.string    "Gender",                  limit: 1,   default: "",                    null: false
    t.boolean   "flStaff",                             default: false,                 null: false
    t.boolean   "flWiped",                             default: false,                 null: false
    t.boolean   "flPartnerShow",                       default: true,                  null: false
    t.boolean   "flBanIM",                             default: false,                 null: false
    t.integer   "flBanStatus",             limit: 1,   default: 0,                     null: false
    t.boolean   "flHideStatusID",                      default: false,                 null: false
    t.text      "HideReason",                                                          null: false
    t.boolean   "flHideReasonPublic",                  default: false,                 null: false
    t.boolean   "flHidden",                                                            null: false
    t.boolean   "flHideTIGMessenger",                  default: false,                 null: false
    t.integer   "flHideBadges",            limit: 1,                                   null: false
    t.boolean   "flEmailSkip",                         default: false,                 null: false
    t.boolean   "flSupporter",                         default: false,                 null: false
    t.boolean   "flPWLocked",                          default: false,                 null: false
    t.integer   "flVerified",              limit: 1,                                   null: false
    t.string    "VerifyKey",               limit: 50,                                  null: false
    t.string    "TimeZoneOffset",          limit: 5,   default: "0",                   null: false
    t.text      "Bio"
    t.string    "URL"
    t.string    "Address"
    t.timestamp "AddressLastUpdate"
    t.string    "City",                    limit: 21
    t.integer   "CityID",                  limit: 3,   default: 0,                     null: false
    t.string    "State",                   limit: 48
    t.integer   "StateID",                 limit: 3,   default: 0,                     null: false
    t.string    "Zipcode",                 limit: 24
    t.string    "Title",                   limit: 55
    t.string    "Organization",            limit: 128
    t.integer   "Posts",                   limit: 3,   default: 0,                     null: false
    t.integer   "nLogins",                 limit: 3,   default: 0,                     null: false
    t.integer   "nProfileViews",           limit: 3,   default: 0,                     null: false
    t.integer   "nPageViews",              limit: 3,   default: 0,                     null: false
    t.string    "HearTIG"
    t.integer   "JoinReasonID",            limit: 2,   default: 0,                     null: false
    t.text      "WhatGain",                                                            null: false
    t.text      "WhatContribute",                                                      null: false
    t.text      "TellUs",                                                              null: false
    t.integer   "Fontsize",                limit: 2,   default: 0,                     null: false
    t.date      "DateJoined",                                                          null: false
    t.string    "ImageName",               limit: 24
    t.string    "smImageName",             limit: 16,  default: "",                    null: false
    t.string    "smImageName64",           limit: 18,                                  null: false
    t.string    "smImageName128",          limit: 18,                                  null: false
    t.datetime  "ImageUpdatedOn",                      default: '2012-08-27 17:31:00', null: false
    t.boolean   "flBlogged",                                                           null: false
    t.boolean   "flQuickJoined",                       default: false,                 null: false
    t.string    "IP",                      limit: 15,                                  null: false
    t.string    "Pushpath",                            default: "",                    null: false
    t.datetime  "LastLogin"
    t.timestamp "SignupDate",                                                          null: false
    t.boolean   "GAT",                                 default: false,                 null: false
    t.boolean   "YR",                                  default: false,                 null: false
    t.boolean   "GYR",                                 default: false,                 null: false
    t.boolean   "TIGmail",                             default: false,                 null: false
    t.boolean   "TIGmailShow",                         default: false,                 null: false
    t.integer   "CobID",                   limit: 2,   default: 0,                     null: false
    t.integer   "RefID",                   limit: 3,   default: 0,                     null: false
    t.integer   "RedirectID",              limit: 3,                                   null: false
    t.boolean   "LeaveAlone",                          default: false,                 null: false
    t.string    "TIGedPrefClassID",        limit: 10,  default: ""
    t.boolean   "edflTeacher",                         default: false,                 null: false
    t.string    "GeoCity",                 limit: 64,  default: "",                    null: false
    t.string    "GeoState",                limit: 20,  default: "",                    null: false
    t.string    "GeoLat",                  limit: 20,  default: "",                    null: false
    t.string    "GeoLong",                 limit: 20,  default: "",                    null: false
    t.integer   "DiscussFlag",             limit: 2,   default: 0,                     null: false
    t.integer   "ActiveRank",              limit: 3,   default: 0,                     null: false
    t.boolean   "flGYCAMember",                        default: false,                 null: false
    t.integer   "GYCAGranteesPhase",       limit: 1,                                   null: false
    t.boolean   "flGYANContact",                       default: false,                 null: false
    t.boolean   "flYMDMember",                         default: false,                 null: false
    t.boolean   "flJHRMember",                         default: false,                 null: false
    t.boolean   "flBounceHold",                        default: false,                 null: false
    t.boolean   "flAboriginal",                                                        null: false
    t.boolean   "flFrancophone",                                                       null: false
    t.boolean   "flJoinLocal",                         default: false,                 null: false
    t.boolean   "flEmailMe",                           default: false,                 null: false
    t.boolean   "flCYG",                               default: false,                 null: false
    t.boolean   "flVV",                                default: false,                 null: false
    t.boolean   "flPersist",                           default: false,                 null: false
    t.boolean   "flMultiLang",                         default: true,                  null: false
    t.integer   "MultilangID",             limit: 1,   default: 0,                     null: false
    t.integer   "DefaultLangID",           limit: 2,   default: 0,                     null: false
    t.integer   "flNECC",                  limit: 1,   default: 0,                     null: false
    t.boolean   "flHideCountryBornTab",                default: false,                 null: false
    t.boolean   "flProfileHideFriends",                default: false,                 null: false
    t.boolean   "flMyTIGHome",                         default: false,                 null: false
    t.integer   "flAddedBySignupVersion7", limit: 1,   default: 0,                     null: false
  end

  add_index "users", ["ActiveRank", "flHideStatusID", "StateID"], name: "ActiveRank", using: :btree
  add_index "users", ["CityID", "smImageName"], name: "CityID", using: :btree
  add_index "users", ["CountryBornID"], name: "CountryBornID", using: :btree
  add_index "users", ["CountryID", "CityID", "UserID"], name: "CountryID_2", using: :btree
  add_index "users", ["CountryID", "StateID", "UserID"], name: "CountryID", using: :btree
  add_index "users", ["DateJoined"], name: "DateJoined", using: :btree
  add_index "users", ["Gender"], name: "Gender", using: :btree
  add_index "users", ["HearTIG"], name: "HearTIG", using: :btree
  add_index "users", ["JoinReasonID"], name: "JoinReasonID", using: :btree
  add_index "users", ["LeaveAlone"], name: "LeaveAlone", using: :btree
  add_index "users", ["Name"], name: "Name", using: :btree
  add_index "users", ["StateID", "smImageName"], name: "StateID", using: :btree
  add_index "users", ["UserTypeID"], name: "UserTypeID", using: :btree
  add_index "users", ["edflTeacher"], name: "edflTeacher", using: :btree
  add_index "users", ["flHideStatusID", "ActiveRank", "StateID"], name: "flHideStatusID", using: :btree
  add_index "users", ["nProfileViews"], name: "nProfileViews", using: :btree
  add_index "users", ["smImageName"], name: "smImageName", using: :btree

end
