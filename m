Return-Path: <prvs=71557624F2=Vladimir_Redzhepov@epam.com>
Received: from EVBYMINSA0102.epam.com (owamsq.epam.com [217.21.63.37])
	by mail.openembedded.org (Postfix) with ESMTP id 89217620B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 10:10:12 +0000 (UTC)
Received: from EVBYMINSA0039.epam.com (10.6.110.9) by EVBYMINSA0111.epam.com
	(10.6.110.13) with Microsoft SMTP Server (TLS) id 15.0.775.38;
	Wed, 19 Mar 2014 13:09:57 +0300
Received: from EPBYMINSA0032.epam.com ([169.254.2.67]) by
	EVBYMINSA0039.epam.com ([10.6.110.9]) with mapi id 14.03.0158.001;
	Wed, 19 Mar 2014 13:09:56 +0300
From: Vladimir Redzhepov <Vladimir_Redzhepov@epam.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] meta-java: using maven build tool
Thread-Index: Ac9DW1+u9NBRMqSKQG+3wWSnHxzwDw==
Date: Wed, 19 Mar 2014 10:09:56 +0000
Message-ID: <4F8CA425FC34A24C8608E3D85A89B1BD3B8C8144@EPBYMINSA0032.epam.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.110.10]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: meta-java: using maven build tool
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Mar 2014 10:10:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I'd like to create a BSP for my device using meta-java layer. The main appl=
ication is written in Java and uses Apache Maven
project management tool. I looked fixedly at meta-java and didn't find this=
 tool. Can you tell me how to make a right build
of my application based on Apache Maven within meta-java? Is it good just t=
o download binary package for maven and
unpack it into the staging directory?

Best Regards,
Vladimir Redzhepov

