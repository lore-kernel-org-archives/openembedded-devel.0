Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 69FB1719DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 15:10:35 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AwDVDvhw3BxqBZkzXCy+O+j09IxM/srCxBDY+r6Qd?=
	=?us-ascii?q?2+ofIJqq85mqBkHD//Il1AaPBtSHra8fwLSH+4nbGkU4qa6bt34DdJEeHzQksu?=
	=?us-ascii?q?4x2zIaPcieFEfgJ+TrZSFpVO5LVVti4m3peRMNQJW2aFLduGC94iAPERvjKwV1?=
	=?us-ascii?q?Ov71GonPhMiryuy+4ZPebgFHiTanYb5/Ihq6oATVu8ILnYZsN6E9xwfTrHBVYe?=
	=?us-ascii?q?pW32RoJVySnxb4+Mi9+YNo/jpTtfw86cNOSL32cKskQ7NWCjQmKH0169bwtRbf?=
	=?us-ascii?q?VwuP52ATXXsQnxFVHgXK9hD6XpP2sivnqupw3TSRMMPqQbwoXzmp8qFmQwLqhi?=
	=?us-ascii?q?gaLT406HzZhNJ+jKxboxyvqRJwzIHWb46JO/RzZb/dcNEASGZdQspcWS5MD4Wh?=
	=?us-ascii?q?ZIUPFeoBOuNYopH5qVQUsRS+AhKjBOT3xTJUnH/5x6I60/knEQ7bwgMvB8gAt2?=
	=?us-ascii?q?7OrNrrNaYZTOe4zKvSwjXZdfxW1ir96I7VfR8/uvyMXL1wftDVyUkuDQzJlEmf?=
	=?us-ascii?q?qYvgPz6M0OkGrmuV7/J4WO+rlmIrsRx9riWty8s2joTEgpgZxk3E+Ch5xos+OM?=
	=?us-ascii?q?e2R1RhYdG+FZtdrySaN4xrTcw8W2xooyM6yqEeuZ68YSgK1Iwrxx7BZPyDdIiF?=
	=?us-ascii?q?+hzjW/yXITZ5hXJlfqywiwyz8Uiv0OL8Usi030xQoiVZldnMs2gB1x3V6seZVv?=
	=?us-ascii?q?tw5kOs1SuV2wzO9+1JI1o4mK7fJpI737I9lpoevVzGHiDsmUX2iKGWdl8j+uit?=
	=?us-ascii?q?8+nnYK/ppoWGOI97lwH+NLkhldKkDOQ5PQgBRWyb+eWm27H54UL5R7BKguUskq?=
	=?us-ascii?q?bFqJDaOdgbpqmhDg9SyoYs9RC/ACmj0NsDg3YIMU9KdwyagITwJl7BPu74Aum7?=
	=?us-ascii?q?g1m3lDdrxuvGPqH6ApnXKXjDiKnufbBj5E5Z0wU8081Q6I9KBb4cOv7zXVXxtN?=
	=?us-ascii?q?OLRiM+ZguszuDqDd9w2o8TVSeDD7GUNIvWsESU/aQoO+SKaYoftTrxJvRj4OTh?=
	=?us-ascii?q?3lEjnlpIX6Ci2pEQX1miF/t7JUmUVkJtmNoTWTMItxA3Q/HshFCqUDFaY3e7Ga?=
	=?us-ascii?q?k742doW8qdEY7fS9X10/S61yChE8gOaw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DeMAAyv4hY/5tjdVteGxgHDBgHgwABA?=
	=?us-ascii?q?QEBAR+BCoQzinqRGJMfgjcZgUyCbIM2AoIaQxQBAQEBAQEBAQEBAWEoQg4BgWI?=
	=?us-ascii?q?Zgh4BBSNmCxgCAiYCAlcTCAEBiRwBrkuCJYphATGBC4VAggWCaoUVgjqCXwWbT?=
	=?us-ascii?q?pFzgV8BF454iCOKVzYhgUiHCj2Fa4J2AQEB?=
X-IPAS-Result: =?us-ascii?q?A2DeMAAyv4hY/5tjdVteGxgHDBgHgwABAQEBAR+BCoQzinq?=
	=?us-ascii?q?RGJMfgjcZgUyCbIM2AoIaQxQBAQEBAQEBAQEBAWEoQg4BgWIZgh4BBSNmCxgCA?=
	=?us-ascii?q?iYCAlcTCAEBiRwBrkuCJYphATGBC4VAggWCaoUVgjqCXwWbTpFzgV8BF454iCO?=
	=?us-ascii?q?KVzYhgUiHCj2Fa4J2AQEB?=
X-IronPort-AV: E=Sophos;i="5.33,284,1477954800"; d="scan'208";a="102914111"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 25 Jan 2017 16:10:34 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cWPDW-0000wC-UP for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:10:34 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cWPDU-00064O-Sc; Wed, 25 Jan 2017 16:10:32 +0100
To: openembedded-devel@lists.openembedded.org
References: <1484311074-14030-1-git-send-email-jaragunde@igalia.com>
	<3c7713c0-10cd-fe2b-3a99-c93841471753@pseudoterminal.org>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <67a782cc-b074-de9e-88dc-cf59a7c56669@igalia.com>
Date: Wed, 25 Jan 2017 16:10:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <3c7713c0-10cd-fe2b-3a99-c93841471753@pseudoterminal.org>
Subject: Re: [meta-browser][PATCH] chromium-wayland: update to 53.0.2785.14
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2017 15:10:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 20/01/17 12:37, Carlos Rafael Giani wrote:
> Looks okay overall. A few details need to be addressed:
> 

Thank you again for the review. I've sent a new version of the patch to
the ML, addressing your comments.

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia

