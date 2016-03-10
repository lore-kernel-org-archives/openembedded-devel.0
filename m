Return-Path: <jaap.dejong@nedap.com>
X-Greylist: delayed 907 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 10 Mar 2016 09:30:27 UTC
Received: from smtp.nedap.com (smtp4.nedap.com [213.160.213.85])
	by mail.openembedded.org (Postfix) with ESMTP id A629D601A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 09:30:27 +0000 (UTC)
Received: from NVS0468.nedap.local (10.1.8.59) by NVS0468.nedap.local
	(10.1.8.59) with Microsoft SMTP Server (TLS) id 15.0.1044.25;
	Thu, 10 Mar 2016 10:15:18 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by RelayNVS0468.nedap.local
	(10.1.8.59) with Microsoft SMTP Server id 15.0.1044.25 via Frontend
	Transport; Thu, 10 Mar 2016 10:15:18 +0100
X-TM-IMSS-Message-ID: <e3640441002dbd63@nedap.com>
Received: from [10.2.16.77] ([10.2.16.77]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id e3640441002dbd63 ;
	Thu, 10 Mar 2016 10:15:21 +0100
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Jaap de Jong <jaap.dejong@nedap.com>
Message-ID: <56E13B20.8010902@nedap.com>
Date: Thu, 10 Mar 2016 10:15:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: Updating configuration files, how to
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
X-List-Received-Date: Thu, 10 Mar 2016 09:30:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I am wondering what the best approach is for creating 'standard' 
packages with updated configuration files.
As an example: I want to have a package with an updated 
/etc/network/interfaces file to reflect my systems hardware.
Should I create a init-ifupdown_1.0.bbappend recipe with the updated file?
What other options do I have?
What are you guys using for this?
And how about the package name in such a case. Append something to its name?

Thanks in advance!
Jaap




