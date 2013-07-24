Return-Path: <jaap.dejong@nedap.com>
Received: from smtp.nedap.com (smtp4.nedap.com [213.160.213.85])
	by mail.openembedded.org (Postfix) with ESMTP id 726416AE86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 11:33:42 +0000 (UTC)
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.279.5; Wed, 24 Jul 2013
	13:33:40 +0200
X-TM-IMSS-Message-ID: <3fef15b10002a825@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 3fef15b10002a825 ;
	Wed, 24 Jul 2013 13:33:48 +0200
Message-ID: <51EFBB94.3000406@nedap.com>
Date: Wed, 24 Jul 2013 13:33:40 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: how to delay postinst script
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
X-List-Received-Date: Wed, 24 Jul 2013 11:33:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
is there a way to delay the postinstall script until next boot?
I don't want the postinstall script to run when I update my package at 
install time, but it should install at the next boot.
Thanks!
Jaap

