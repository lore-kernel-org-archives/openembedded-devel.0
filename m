Received: from mail-yw0-f201.google.com ([209.85.211.201])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OPEJ7-0000X5-J0
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 14:35:16 +0200
Received: by ywh39 with SMTP id 39so5456279ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=3zXHa5eSw15pVhrL02OM/uhGguGO6fj1ilOV4mcCD6c=;
	b=Phh855wxdt07UXlCMpMZZwqvEHo1lOw96sHKaoK6c81ctqVV7RbMdcutDu7MI9sbp8
	+/0RHqXncmDm6wb6IMXSFVdqa43IISg9XM3wCGvmzBCOZRaRjobrqiV7n5RHXLrc+KNp
	P4HIh1P5FLsYi0xwsjbj2S0V4Vmt7eRtGhg3c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MlCUncrJzQrifuiIYbSt8ExvplV/sSVar6lFXF7g1yejYZFOvTxGnKpu92HuJIslvn
	Si066xXdGki2AlQbSBFCLnHyEq54o8RBScIJao9o+LAXFzhh63V+Ll3C3w8E80zs+If6
	LNHMoH8piuogL6o+E3/gJYby57koKE8Gi3BWI=
MIME-Version: 1.0
Received: by 10.101.132.36 with SMTP id j36mr8525895ann.128.1276777790430; 
	Thu, 17 Jun 2010 05:29:50 -0700 (PDT)
Received: by 10.100.194.6 with HTTP; Thu, 17 Jun 2010 05:29:50 -0700 (PDT)
In-Reply-To: <AANLkTimG439FroM6HmVePh9WeX2nlxdkn1RVtBqI1y96@mail.gmail.com>
References: <AANLkTimG439FroM6HmVePh9WeX2nlxdkn1RVtBqI1y96@mail.gmail.com>
Date: Thu, 17 Jun 2010 14:29:50 +0200
Message-ID: <AANLkTilVz61aIHqmbyJzeLziznigPLtObD48D-aFRAqm@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.201
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] purge recipes/linux-kexecboot and move to recipes/linux
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
X-List-Received-Date: Thu, 17 Jun 2010 12:35:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Well,

fwiw actually recipes are in recipes/kexecboot and not recipes/linux-kexecboot

if one ever needs to look at those ;)


Sorry
Andrea


