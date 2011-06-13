Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QWEYG-0001MF-2M
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 23:20:04 +0200
Received: by qyk27 with SMTP id 27so3346426qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 14:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=pNI6bwLS3KyLHkypBPFuRhJdEkGdj3STyMLQepq/saM=;
	b=COikrr5xb7nVRPAFFGqmkd8N1qJEBOWI0Q6PaQMmUDD597GJrk2fcuiY+FA+1VK9ui
	zAoT1kP0lZkWVsP5yqVh+3Uvzq2rP9Gr6GbvKbDs6VkYVAHFzwGE73FOFDVYsbuSYOIN
	gZBU7BJR8Vs+edl39mK44MGme0p4mzCrc2INA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=P4NVGj1kRuFILtTozo7/L1CH4NBzOcFhWjc9npU50yjw1wc4113XGOV1YQFxOg9HlM
	BEeJ7xSl2+NwPfOzb91NbKnfPmk+v+123q4zi5ALZ5WCllCLXzkJVWxor6QY0LT+RfO3
	ueY31KVkc1bMvI6KTYr5CMAloj1xfBN5hxKmY=
MIME-Version: 1.0
Received: by 10.229.61.22 with SMTP id r22mr4351170qch.174.1307999797786; Mon,
	13 Jun 2011 14:16:37 -0700 (PDT)
Received: by 10.229.73.206 with HTTP; Mon, 13 Jun 2011 14:16:37 -0700 (PDT)
In-Reply-To: <1307996077.4081.6.camel@mattotaupa>
References: <1307987531-2625-1-git-send-email-pespin.shar@gmail.com>
	<1307988638.4081.5.camel@mattotaupa>
	<BANLkTi=4kSE18LPqTyEgYRmZViJ4f+gGgw@mail.gmail.com>
	<BANLkTinVfs_kznrr9C9G2jtS516ud99Ltw@mail.gmail.com>
	<BANLkTinr27EvybkKQuG+i0ZWs6QthjxgcA@mail.gmail.com>
	<1307996077.4081.6.camel@mattotaupa>
Date: Mon, 13 Jun 2011 23:16:37 +0200
Message-ID: <BANLkTikxGpZbYYq55VtCKSdA_3T-VRO3fA@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] enjoy: add alsa and autodetect gst modules. Without autodetect, enjoy segfaults. Without alsa, no sound is played
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
X-List-Received-Date: Mon, 13 Jun 2011 21:20:04 -0000
Content-Type: text/plain; charset=UTF-8

2011/6/13 Paul Menzel <paulepanter@users.sourceforge.net>

> But maybe it should fail gracefully and not segfault.


For sure, but imo this has nothing to do with this patch. I'm just adding
needed deps for the app to do its work as expected :)

-- 
Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

