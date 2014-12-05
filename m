Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-01.prod.phx3.secureserver.net
	(p3plsmtpa09-01.prod.phx3.secureserver.net [173.201.193.230])
	by mail.openembedded.org (Postfix) with ESMTP id DA2407232C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 00:29:00 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-01.prod.phx3.secureserver.net with 
	id PcUz1p00A0BVjqb01cUzbr; Thu, 04 Dec 2014 17:29:00 -0700
Message-ID: <5480FC4B.2090709@pabigot.com>
Date: Thu, 04 Dec 2014 18:28:59 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1417031737.git.pab@pabigot.com>
In-Reply-To: <cover.1417031737.git.pab@pabigot.com>
Subject: Re: [PATCH 0/2] add conflicts for recipes incompatible with bluez5
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
X-List-Received-Date: Fri, 05 Dec 2014 00:29:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ping.  These are independent of the RFC patches.

On 11/26/2014 02:06 PM, Peter A. Bigot wrote:
> The following changes since commit 34be57e7454ffe5f591cc0d7638bf41bb4377a61:
>
>    meta-networking: update LAYERDEPENDS (2014-11-24 14:12:02 -0500)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/meta-openembedded-contrib pabigot/bluez5
>    http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=pabigot/bluez5
>
> Peter A. Bigot (2):
>    obexd: conflict with bluez5
>    obex-data-server: conflict with bluez5
>
>   meta-gnome/recipes-connectivity/obex/obexd_0.48.bb          | 2 ++
>   meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb | 1 +
>   2 files changed, 3 insertions(+)
>


