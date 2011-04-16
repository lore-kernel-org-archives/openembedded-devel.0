Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bgamari.foss@gmail.com>) id 1QB7E1-00080G-8f
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 17:15:53 +0200
Received: by vws2 with SMTP id 2so3170244vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:in-reply-to:user-agent:date
	:message-id:mime-version:content-type;
	bh=hmsGQ4FxLHF+Qx/D2FqZeybe1FJhC5sly8ED+G1o9Bk=;
	b=R/GxTuQ9Gyzvh6toMBgmZ+Vnaij7OwXqNqMW57GW55MTvygqdhPWHR9bN+5ZpmNNlj
	lcJMG8mcXF76pynMMtct4VCmpZ/pC85MM72CPX30TaGYEY0ITdnmf6ruxGmwndQBMV1h
	63D5d9H8fVpz3wIHd8t9V87KRZgWL/hEcjuc4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:in-reply-to:user-agent:date:message-id:mime-version
	:content-type;
	b=cBhD+T/n6euNiDutYxPrf0xKhN/4aT4gkj7hJXjF3yUDcBBkqd6+XWh4adDE60cwYB
	4r15Y+lUC/RUPBY+x2roWq1b7iEa4UGM4wXjyygMRxR9cBj1NyZaFOK1vZisoQVobZmF
	dN27gbV3h+tzAPJASLpVSVCuOrBkThtRn0DKE=
Received: by 10.52.169.39 with SMTP id ab7mr4615293vdc.230.1302966814629;
	Sat, 16 Apr 2011 08:13:34 -0700 (PDT)
Received: from localhost (gamari.physics.umass.edu [128.119.56.223])
	by mx.google.com with ESMTPS id p29sm825938vcr.31.2011.04.16.08.13.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Apr 2011 08:13:33 -0700 (PDT)
From: Ben Gamari <bgamari.foss@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100322160729.4972.62697.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: Notmuch/0.5-83-g74bc93f (http://notmuchmail.org) Emacs/23.2.1
	(x86_64-pc-linux-gnu)
Date: Sat, 16 Apr 2011 11:13:32 -0400
Message-ID: <87zknq5iw3.fsf@gmail.com>
MIME-Version: 1.0
Subject: [oe,RFC,v2] Alternative to busybox, using "proper tools"
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
X-List-Received-Date: Sat, 16 Apr 2011 15:15:53 -0000
Content-Type: text/plain; charset=us-ascii


Did anything ever happen with this[1] patch? If not, is there another
convenient way to use the proper tools in leiu of busybox? For larger
machines it's very nice to have a more civilized environment. Thanks,

 - Ben


