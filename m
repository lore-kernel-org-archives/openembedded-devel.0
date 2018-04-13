Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 22F2972EE6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 08:22:51 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1f6twl-0006Ql-18 for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2018 10:20:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 13 Apr 2018 10:22:39 +0200
Message-ID: <papp8c$n9j$1@blaine.gmane.org>
References: <CALbNGRT5ZWGZ=YCaSgpmryCzQFPKxDFYLCbOgSP3T1L9gJ0L3g@mail.gmail.com>
	<1523588270-121531-1-git-send-email-hongxu.jia@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
In-Reply-To: <1523588270-121531-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH V2][meta-gnome] metacity: add back and change upstream
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
X-List-Received-Date: Fri, 13 Apr 2018 08:22:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: nl

Op 13-04-18 om 04:57 schreef Hongxu Jia:

> +
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb

> +PR = "r1"
Please drop the PR=r1 line, since the recipe gets readded there shouldn't be an issue for package feeds.


