Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J5gm6-0007KR-4o
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 13:14:46 +0100
Received: by fg-out-1718.google.com with SMTP id 22so137979fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2007 04:09:34 -0800 (PST)
Received: by 10.86.80.5 with SMTP id d5mr1073145fgb.57.1198238974284;
	Fri, 21 Dec 2007 04:09:34 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id a37sm1324440fkc.3.2007.12.21.04.09.32
	(version=SSLv3 cipher=OTHER); Fri, 21 Dec 2007 04:09:33 -0800 (PST)
Date: Fri, 21 Dec 2007 14:14:48 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <736893224.20071221141448@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <476B0D45.4020209@gmx.net>
References: <fkc9de$365$1@ger.gmane.org> <476A26BB.1010602@student.utwente.nl>
	<1871890373.20071220150812@gmail.com> <476B0D45.4020209@gmx.net>
MIME-Version: 1.0
Subject: Re: RFC: drop quilt version 0.39
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2007 12:14:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Robert,

Friday, December 21, 2007, 2:48:05 AM, you wrote:

> Hi.

> Paul Sokolovsky schrieb:
>> Hello Koen,
>> To elaborate, I hope that we'll revamp OE support for using external
>> toolchains for building single packages, because it seems that people
>> have got a stereotype that OE is for building entire system from
>> scratch (at that would be too limiting - why I'd use top-notch
>> solution to build a whole distro while revert to using adhoc tools to
>> build packages for 3rd-party systems?)
> I second this. At jalimo we heavily use OE to build packages for Maemo.
> I find this much more sane than endlessly fighting with scratchbox ...

>> For example, I just pushed openwrt-sdk distro config, which allows
>> to build packages against OpenWRT SDK. Due to OpenWRT dependencies, it
>> may be required to build older than the latest versions of some
>> packages.
> Would be fun to bring OpenWRT people to a point where they only manage a
> small set of core packages and create every other package using OE ...

  Yeah, conquering the world if always fun, but we should start with
small things, like making it *easy* to build packages for 3rd-party
systems, and fight OE stereotypes, the biggest of which:

1. OE is hard to install and setup
2. OE builds only complete images for installing "from scratch"
3. OE is only for PDAs and builds only big images.

> Regards
> Robert




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



