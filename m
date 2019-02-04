Return-Path: <scott@jumpnowtek.com>
X-Greylist: delayed 500 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Feb 2019 22:11:39 UTC
Received: from smtp113.ord1c.emailsrvr.com (smtp113.ord1c.emailsrvr.com
	[108.166.43.113])
	by mail.openembedded.org (Postfix) with ESMTP id C39067C0F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 22:11:39 +0000 (UTC)
Received: from smtp15.relay.ord1c.emailsrvr.com (localhost [127.0.0.1])
	by smtp15.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id
	52B8120256; Mon,  4 Feb 2019 17:03:20 -0500 (EST)
X-Auth-ID: scott@jumpnowtek.com
Received: by smtp15.relay.ord1c.emailsrvr.com (Authenticated sender:
	scott-AT-jumpnowtek.com) with ESMTPSA id 1661C20324; 
	Mon,  4 Feb 2019 17:03:20 -0500 (EST)
X-Sender-Id: scott@jumpnowtek.com
Received: from [192.168.10.4] (c-73-234-253-132.hsd1.me.comcast.net
	[73.234.253.132]) (using TLSv1.2 with cipher AES128-SHA)
	by 0.0.0.0:465 (trex/5.7.12); Mon, 04 Feb 2019 17:03:20 -0500
To: Scott Ellis <scottellis.developer@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1549201073-6116-1-git-send-email-scott@jumpnowtek.com>
	<1549201073-6116-2-git-send-email-scott@jumpnowtek.com>
From: Scott Ellis <scott@jumpnowtek.com>
Message-ID: <78a59c5f-bbf4-dcf4-e258-dc2eb53e7ef5@jumpnowtek.com>
Date: Mon, 4 Feb 2019 17:03:18 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1549201073-6116-2-git-send-email-scott@jumpnowtek.com>
Subject: Re: [meta-oe][PATCH 2/2] nmap: Include additional FILES path for certs
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
X-List-Received-Date: Mon, 04 Feb 2019 22:11:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

These nmap patches got applied to master, thanks.

Do I need to send additional patches to get them into thud?

They are both bug fixes only and should both apply cleanly. The nmap
recipe for master and thud were the same.

