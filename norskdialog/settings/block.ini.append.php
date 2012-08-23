<?php /*

[General]
AllowedTypes[]
AllowedTypes[]=Manual2News
AllowedTypes[]=Manual5News
AllowedTypes[]=Manual10
AllowedTypes[]=InfoBox
AllowedTypes[]=Gallery
AllowedTypes[]=Video
AllowedTypes[]=ItemList
AllowedTypes[]=MainStory
AllowedTypes[]=Banner
AllowedTypes[]=TagCloud
AllowedTypes[]=Poll
AllowedTypes[]=FlashRecorder
AllowedTypes[]=ToppBlokk
AllowedTypes[]=Dynamic3Items
AllowedTypes[]=Dynamic15Articles
AllowedTypes[]=Dynamic25Articles
AllowedTypes[]=SideMenu
AllowedTypes[]=OverskriftLenke
AllowedTypes[]=ForumLast
AllowedTypes[]=ForumList
AllowedTypes[]=Banner_slide
AllowedTypes[]=Banner_elements
AllowedTypes[]=User_account
#AllowedTypes[]=Banner

#[Example]
## Name of the block type as shown in the editorial interface.
#Name=Fetch Name Shown In Editorial Interface
## How many items are valid, as the new ones are being added, the oldest ones
## are moved to archive (or moved to another block) so that in any moment,
## max. NumberOfValidItems are valid.
#NumberOfValidItems=10
#NumberOfArchivedItems=5
#ManualAddingOfItems=disabled
#TTL=86400
#FetchClass=ezmExample
#FetchFixedParameters[]
#FetchFixedParameters[Class]=article;folder
#FetchFixedParameters[...]=...
#FetchParameters[]
#FetchParametersIsRequired[]
FetchParameters[Source]=NodeID
#FetchParametersIsRequired[Source]=true
# single / multiple
FetchParametersSelectionType[Source]=single
# true / false
FetchParametersIsRequired[Source]=true
#FetchParameters[...]=string
#FetchParameters[...]=integer
#CustomAttributes[]=node_id
#UseBrowseMode[node_id]=true
#ViewList[]=variation1
#ViewName[variation1]=Main sotry 1
#

[Banner]
Name=Banner (Manual)
NumberOfValidItems=5
NumberOfArchivedItems=10
ManualAddingOfItems=enabled
ViewList[]=topp_banner
ViewName[topp_banner]=Topp banner enkel

[Banner_slide]
Name=Banner slideshow (Manual)
NumberOfValidItems=10
NumberOfArchivedItems=10
ManualAddingOfItems=enabled
ViewList[]=topp_banner_slide
ViewName[topp_banner_slide]=Banner slideshow (10)

[Banner_elements]
Name=Banner elements (Manual)
NumberOfValidItems=1
NumberOfArchivedItems=1
ManualAddingOfItems=enabled
ViewList[]=banner_elements
ViewName[banner_elements]=Banner elements (10)

[User_account]
Name=User Account
NumberOfValidItems=1
NumberOfArchivedItems=1
ManualAddingOfItems=disabled
ViewList[]=user_account
ViewName[user_account]=User account

[OverskriftLenke]
Name=Overskrift (Manual)
NumberOfValidItems=1
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
ViewList[]=overskrift1
ViewName[overskrift1]=Overskrift H1
ViewList[]=overskrift2
ViewName[overskrift2]=Overskrift H2

[Manual10]
Name=10 Manuell visning (Manual)
NumberOfValidItems=10
NumberOfArchivedItems=10
ManualAddingOfItems=enabled
ViewList[]=full
ViewName[full]=Full
ViewList[]=line
ViewName[line]=Line
ViewList[]=list
ViewName[list]=List
ViewList[]=forum
ViewName[forum]=forum

[ForumLast]
Name=Forum visninger (Manual)
NumberOfValidItems=15
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=last5
ViewName[last5]=Siste 5 Sticky
ViewList[]=last10
ViewName[last10]=Siste 10 Sticky
ViewList[]=last20
ViewName[last20]=Siste 20 Sticky
#ViewList[]=forum_list
#ViewName[forum_list]=List forum

[ForumList]
Name=Liste visning forums (Manual)
NumberOfValidItems=15
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=forums
ViewName[forums]=Liste visning forums

[Manual2News]
Name=15 Nyheter (Manual)
NumberOfValidItems=15
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=news_h2
ViewList[]=news_h3
ViewList[]=news_h4
ViewList[]=news_h2_large_img
ViewList[]=news_h3_large_img
ViewList[]=news_h4_large_img
ViewList[]=news_h2_medium_img
ViewList[]=news_h3_medium_img
ViewList[]=news_h4_medium_img
ViewList[]=news_h2_right
ViewList[]=news_h3_right
ViewList[]=news_h4_right
ViewName[news_h2]=2 Nyheter H2 (1)
ViewName[news_h3]=2 Nyheter H3 (2)
ViewName[news_h4]=2 Nyheter H4 (3)
ViewName[news_h2_large_img]=2 Nyheter stort bilde H2 (4)
ViewName[news_h3_large_img]=2 Nyheter stort bilde H3 (5)
ViewName[news_h4_large_img]=2 Nyheter stort bilde H4 (6)
ViewName[news_h2_medium_img]=2 Nyheter stort bilde 300px H2 (7)
ViewName[news_h3_medium_img]=2 Nyheter stort bilde 300px H3 (8)
ViewName[news_h4_medium_img]=2 Nyheter stort bilde 300px H4 (9)
ViewName[news_h2_right]=2 Nyheter Bilde høyre H2 (10)
ViewName[news_h3_right]=2 Nyheter Bilde høyre H3 (11)
ViewName[news_h4_right]=2 Nyheter Bilde høyre H3 (12)

[Manual5News]
Name=5 News (Manual)
NumberOfValidItems=5
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=news_h2
ViewList[]=news_h3
ViewList[]=news_h4
ViewList[]=news_h2_large_img
ViewList[]=news_h3_large_img
ViewList[]=news_h4_large_img
ViewList[]=news_h2_right
ViewList[]=news_h3_right
ViewList[]=news_h4_right
ViewName[news_h2]=2 Nyheter H2 (1)
ViewName[news_h3]=2 Nyheter H3 (2)
ViewName[news_h4]=2 Nyheter H4 (3)
ViewName[news_h2_large_img]=2 Nyheter stort bilde H2 (4)
ViewName[news_h3_large_img]=2 Nyheter stort bilde H3 (5)
ViewName[news_h4_large_img]=2 Nyheter stort bilde H4 (6)
ViewName[news_h2_right]=2 Nyheter Bilde høyre H2 (7)
ViewName[news_h3_right]=2 Nyheter Bilde høyre H3 (8)
ViewName[news_h4_right]=2 Nyheter Bilde høyre H3 (9)

[InfoBox]
Name=InfoBox (Manual)
NumberOfValidItems=5
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=infobox1
ViewList[]=infobox2
ViewList[]=infobox3
ViewName[infobox1]=Infobox (1)
ViewName[infobox2]=Infobox border
ViewName[infobox3]=Infobox white

[SideMenu]
Name=Sidemenu (Manual)
NumberOfValidItems=3
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
ViewList[]=sidemenu
ViewName[sidemenu]=Sidemenu(1)

[Manual2Items]
Name=2 items (Manual)
NumberOfValidItems=2
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=2_items1
ViewList[]=2_items2
ViewName[2_items1]=2 items (1)
ViewName[2_items2]=2 items (2)

[Manual3Items]
Name=3 items (Manual)
NumberOfValidItems=3
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=3_items1
ViewList[]=3_items2
ViewList[]=3_items3
ViewName[3_items1]=3 items (1)
ViewName[3_items2]=3 items (2)
ViewName[3_items3]=3 items (3 cols)

[Manual4Items]
Name=4 items (Manual)
NumberOfValidItems=4
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=4_items1
ViewList[]=4_items2
ViewList[]=4_items3
ViewName[4_items1]=4 items (1)
ViewName[4_items2]=4 items (2)
ViewName[4_items3]=4 items (3)

[Manual5Items]
Name=5 items (Manual)
NumberOfValidItems=5
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=5_items1
ViewList[]=5_items2
ViewName[5_items1]=5 items (1)
ViewName[5_items2]=5 items (2)

[Gallery]
Name=Gallery (Manual)
NumberOfValidItems=4
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=gallery1
ViewName[gallery1]=Gallery (1)

[Video]
Name=Video (Manual)
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=video
ViewName[video]=Video player

[ItemList]
Name=Item list
NumberOfValidItems=12
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=itemlist1
ViewList[]=itemlist2
ViewList[]=itemlist3
ViewName[itemlist1]=List (1 col)
ViewName[itemlist2]=List (2 cols)
ViewName[itemlist3]=List (3 cols)

[MainStory]
Name=Main story (Manual)
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=main_story1
ViewList[]=main_story2
ViewList[]=main_story3
ViewName[main_story1]=Main story (1)
ViewName[main_story2]=Main story (2)
ViewName[main_story3]=Main story (3)

#[Banner]
#Name=Banner
#NumberOfValidItems=1
#NumberOfArchivedItems=5
#ManualAddingOfItems=disabled
#ViewList[]=banner1
#ViewList[]=banner2
#ViewName[banner1]=Banner (medium)
#ViewName[banner2]=Banner (small)

[TagCloud]
Name=Tag cloud
ManualAddingOfItems=disabled
CustomAttributes[]=subtree_node_id
UseBrowseMode[subtree_node_id]=true
ViewList[]=tag_cloud
ViewName[tag_cloud]=Tag cloud

[Poll]
Name=Poll
ManualAddingOfItems=disabled
CustomAttributes[]=poll_node_id
UseBrowseMode[poll_node_id]=true
ViewList[]=poll
ViewName[poll]=Poll

[FlashRecorder]
Name=Flash Recorder
NumberOfValidItems=8
NumberOfArchivedItems=4
ManualAddingOfItems=enabled
ViewList[]=flash_recorder
ViewName[flash_recorder]=Flash Recorder

[ToppBlokk]
Name=1 item (Topp Blokk)
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=topp_block1
ViewName[topp_block1]=item block (1)

[Dynamic3Items]
Name=3 items (dynamic)
NumberOfValidItems=3
NumberOfArchivedItems=5
ManualAddingOfItems=disabled
FetchClass=ezflowlatestobjects
FetchFixedParameters[]
FetchFixedParameters[Class]=article;folder
FetchParameters[]
FetchParameters[Source]=nodeID
FetchParametersSelectionType[Source]=single
FetchParametersIsRequired[]
FetchParametersIsRequired[Source]=true
ViewList[]=3d_items
ViewName[3d_items]=3 items (1)
ViewList[]=3d_list
ViewName[3d_list]=3 items list (2)
TemplateList[3d_items]=3d_items.tpl
TemplateList[3d_list]=3d_list.tpl

[Dynamic15Articles]
Name=15 articles (dynamic)
NumberOfValidItems=15
NumberOfArchivedItems=5
ManualAddingOfItems=disabled
FetchClass=ezflowlatestobjects
FetchFixedParameters[]
FetchFixedParameters[Class]=article;folder
FetchParameters[]
FetchParameters[Source]=nodeID
FetchParametersSelectionType[Source]=single
FetchParametersIsRequired[]
FetchParametersIsRequired[Source]=true
ViewList[]=15d_articles
ViewName[15d_articles]=15 artikler ingress (1)
ViewList[]=15d_articles_list
ViewName[15d_articles_list]=15 artikler liste (2)
TemplateList[15d_articles]=15d_articles_ingress.tpl
TemplateList[15d_articles_list]=15d_articles_list.tpl

[Dynamic25Articles]
Name=25 articles (dynamic)
NumberOfValidItems=25
NumberOfArchivedItems=5
ManualAddingOfItems=disabled
FetchClass=ezflowlatestobjects
FetchFixedParameters[]
FetchFixedParameters[Class]=article;folder
FetchParameters[]
FetchParameters[Source]=nodeID
FetchParametersSelectionType[Source]=single
FetchParametersIsRequired[]
FetchParametersIsRequired[Source]=true
ViewList[]=25d_articles
ViewName[25d_articles]=25 artikler ingress (1)
ViewList[]=25d_articles_list
ViewName[25d_articles_list]=25 artikler liste (2)
TemplateList[25d_articles]=15d_articles_ingress.tpl
TemplateList[25d_articles_list]=15d_articles_list.tpl

*/ ?>
