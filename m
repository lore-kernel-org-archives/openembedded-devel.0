Return-Path: <scott@jumpnowtek.com>
X-Greylist: delayed 501 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Feb 2019 12:27:01 UTC
Received: from smtp96.iad3a.emailsrvr.com (smtp96.iad3a.emailsrvr.com
	[173.203.187.96])
	by mail.openembedded.org (Postfix) with ESMTP id EB62A6C37F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 12:27:01 +0000 (UTC)
Received: from smtp21.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
	by smtp21.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	48BAF25293 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 07:18:41 -0500 (EST)
X-Auth-ID: scott@jumpnowtek.com
Received: by smtp21.relay.iad3a.emailsrvr.com (Authenticated sender:
	scott-AT-jumpnowtek.com) with ESMTPSA id 2827B25222
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 07:18:41 -0500 (EST)
X-Sender-Id: scott@jumpnowtek.com
Received: from [192.168.10.4] (c-73-234-253-132.hsd1.me.comcast.net
	[73.234.253.132]) (using TLSv1.2 with cipher AES128-SHA)
	by 0.0.0.0:465 (trex/5.7.12); Wed, 13 Feb 2019 07:18:41 -0500
To: openembedded-devel@lists.openembedded.org
References: <20190212212745.6773-1-Randy.MacLeod@windriver.com>
From: Scott Ellis <scott@jumpnowtek.com>
Message-ID: <30c5fa90-fa8e-0325-5d85-7fcc70ad32d1@jumpnowtek.com>
Date: Wed, 13 Feb 2019 07:18:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190212212745.6773-1-Randy.MacLeod@windriver.com>
Subject: Re: [PATCH] imagemagick: add homepage and description
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
X-List-Received-Date: Wed, 13 Feb 2019 12:27:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

-+SUMMARY = "ImageMagick is an image convertion toolkit"
++SUMMARY = "ImageMagick is an image conversion toolkit"

