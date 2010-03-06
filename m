Received: from mail-yw0-f183.google.com ([209.85.211.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NnzqW-0006ls-I1
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 20:39:35 +0100
Received: by ywh13 with SMTP id 13so3128548ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Mar 2010 11:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=qiVcgshoxuWAO8naXQHPNE0zRwzwat6fIxKpg39YUfY=;
	b=vdR9HW69dHV5lRO47AKBMGBZ9/3dx9f9h6oRIFhyiiVrd9GwEBKinnoepWT9ZxtAaD
	U1U902t9pyDFI16MAhGqDT/INltUf08YgLRsEWOegYpXxDtH1LnmgelXdNt/tKr+PQ7G
	tsJENg73AKldQj/4uoqMIVUDD++oqeNuYntpI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UqZNVNrVgopJY5Wwq++uFCjH2gc2s05vhLvriKGsYjZ2Mi0y5Ww4cZBGDdmwkyhK10
	i5ifZrtZL1RmY3are5MOxZZd6O0HBi9EELMAk24SnLwZhE145RQM+qJ5uhPV3SeKNHJu
	B9QVZi7GfSX0z2n7FnjUEode94hSJ7Y1po+Z4=
MIME-Version: 1.0
Received: by 10.101.6.30 with SMTP id j30mr3586010ani.200.1267904197722; Sat, 
	06 Mar 2010 11:36:37 -0800 (PST)
In-Reply-To: <hmeia3$p6c$1@dough.gmane.org>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<hmeia3$p6c$1@dough.gmane.org>
Date: Sat, 6 Mar 2010 20:36:37 +0100
Message-ID: <ac9c93b11003061136k1668098ejbff2f7ebcf7278c7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.183
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Sat, 06 Mar 2010 19:39:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/28 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> How do you know that some versions aren't used at all? Did you check all
> external overlays?
>
> But more importantly, what harm do the recipes do to you? Does it offend
> you that there are 26 recipes?
>
> What are you trying to accomplish?
>
> If a recipe isn't doing any harm, just leave it alone. Deleting recipes
> just to please someones sense of aesthetics is the wrong thing to do.
>
> What would be a lot better is to fix the latest version for each minor
> release to use things like new style staging, bbclassextend, etc and
> *after* that clean up ask to remove the recipes that weren't updated.

As requested on #oe:

ACK for the proposal above. Seems a good start :-)

Frans


