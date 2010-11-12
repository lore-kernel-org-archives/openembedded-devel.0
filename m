Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1PH13l-0008Hv-Rh
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 22:21:26 +0100
Received: by ewy24 with SMTP id 24so1893669ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 13:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=ngHn31LFrBw1lsJAL2dnGg2jmUaicMl70FVbqF8mxeE=;
	b=PvleN8ugED7rrNCWvkHMh0uaKU0gDxhQJo7TiQyfFX4oNmhUi804SMH6ExsI+cvYrt
	3R6VjFoL8cOmpbEbPmVeMcgH38enl2anqQAHQj1P792TP9mu77E/cXP5CdG53Vi+aPcd
	hp4uaNLGjadSByiRcsWamxi6mzI3K0Q6ShyN0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=cbl/1WzSQJIHrj9bzOEiFqwBIP2icdF7iqvDkMXZVRLZtN9JKM4DIYkXRM/NM7rJou
	rEKMA82bJrVOPkqiIABTgyYfXyGlYDZ/FLri/dbjHLf7vGRV2hwDJ7TQ9hl4ESuEWY9A
	WqzGy5i9O6nWmW643get2q4MNuriJZOhXwgKk=
Received: by 10.213.3.11 with SMTP id 11mr95020ebl.82.1289596826945;
	Fri, 12 Nov 2010 13:20:26 -0800 (PST)
Received: from anarsoul-laptop.localnet ([80.249.83.145])
	by mx.google.com with ESMTPS id q58sm3633158eeh.9.2010.11.12.13.20.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 12 Nov 2010 13:20:25 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Nov 2010 23:19:42 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.36-gentoo-anarsoul; KDE/4.5.3; i686; ; )
References: <1289596368-4717-1-git-send-email-GNUtoo@no-log.org>
In-Reply-To: <1289596368-4717-1-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
Message-Id: <201011122319.43035.anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libsdl-x11 1.2.14 : fix alsa detection
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Nov 2010 21:21:26 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 12 November 2010 23:12:47 Denis 'GNUtoo' Carikli wrote:
> hi,
> 
> Here's a patch that fixes alsa detection with libsdl-x11 1.2.14
> 
> on irc(#oe on Freenode) khem asked me to send a patch for that so he could
> review it.
> 
> Here it is.
> 
> Denis.

And you forgot to attach patch :)


