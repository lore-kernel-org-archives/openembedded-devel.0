Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RUmi4-0005JA-3n
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 22:56:28 +0100
Received: by vbbfc21 with SMTP id fc21so2790215vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 13:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wOt6s5SdV4xkXP9+L7nsCbRtAbALTW4Qs7qHv5W+KYs=;
	b=kyDywd7ouvlExGN8eQ4G+9gf5YQyfDqZ9NPPpJCKRBRjb6FNQOkJOsXk3pjgpUru6x
	Wi7xxuQoFkCJpyaU3s2MQtqA3XpqikjpoS6F8P5HPY/tUc5F+Y0F6lEhQbxWHXB14v2b
	XEPnlbBNLQOpu864VrpQGMLXgj5MNRhHgsqVE=
MIME-Version: 1.0
Received: by 10.52.34.207 with SMTP id b15mr40877713vdj.19.1322430583400; Sun,
	27 Nov 2011 13:49:43 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Sun, 27 Nov 2011 13:49:43 -0800 (PST)
In-Reply-To: <1322420806.7998.50.camel@mattotaupa>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<15202278.8Gdc2a6et6@helios> <1322419119.7998.43.camel@mattotaupa>
	<1414964.lPpRFmgCOe@helios> <1322420806.7998.50.camel@mattotaupa>
Date: Sun, 27 Nov 2011 22:49:43 +0100
Message-ID: <CACW_hTZMQQ9uTTGhvCk1x6zgPpQRsUz64XTdyKYF5UKX_Fw=yg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Documentation problems
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
X-List-Received-Date: Sun, 27 Nov 2011 21:56:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Generally speaking writing documentation is difficult and a task not liked
by most sw developers (me included).
People should be encouraged and it should be as easy as possible.
The more difficult it is, the less likely it is people will do it.

Then again I am not too sure what we need, given the yocto documentation.

BTW and if a certain part of the wiki is for a specific purpose (e.g.
related to a distro): in most wiki's it is possible to restrict access to
certain pages to a specific group.
Then again that all needs to be managed....

Frans

