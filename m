Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P07Ne-00079L-Dm
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 08:40:07 +0200
Received: by iwn2 with SMTP id 2so2699251iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Sep 2010 23:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=O0EF1DpRcNMwTL5lclea6cikE5xncz6maXNJGseI8SI=;
	b=H89cunui/JP9ZnJzTQDB9QrrDVvGK2AWbzeBwto65+R2rkBUaAAdeVyRXWTW4cNAgT
	fRl7/JNqaWnAGW/3vnah4S0VeQsSDUMDZjGLaUW1wHUT4vbk52tF/qOxtyO1chpdYRRe
	YT181AV5OBp4yTbenV/NNFq5DK9/pXbvjXvDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=v98C8mSZsj2EVFHH/MWygZH+dNdpSPkupT4C/1DVrZRpO5vfeLQBP+TCVpeSrifgpB
	HvpTKPCznzuQs6wOAb+Mrc9fLD3/Ebgu0mqaNX+mGXlMNvL68NQhWaSKrWvc+VOG9ECf
	7t7zX1Drsd2wNHq6esIQYougHgVEyUEcIYHfk=
MIME-Version: 1.0
Received: by 10.231.14.5 with SMTP id e5mr8166530iba.175.1285569597818; Sun,
	26 Sep 2010 23:39:57 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 26 Sep 2010 23:39:57 -0700 (PDT)
In-Reply-To: <AANLkTi=_gXRqO6Se0it=rG3rRoCF1rUVejp=TFqNOpXo@mail.gmail.com>
References: <20100926124317.GR28423@ibawizard.net>
	<AANLkTi=_gXRqO6Se0it=rG3rRoCF1rUVejp=TFqNOpXo@mail.gmail.com>
Date: Mon, 27 Sep 2010 08:39:57 +0200
Message-ID: <AANLkTinQ1oORFJ09nd-uzHh6LiaeTYoje3KVOqAAjp1y@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Strange bluez dependency for ppp
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
X-List-Received-Date: Mon, 27 Sep 2010 06:40:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/27 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
[...]
>
> I guess the _3 things refer to bluez3, but bluez3 apparently does not exist.
> bluez.inc is not included by anyone
> there are recipes for .56 .59 and .66 (although with DP = "-1" except
> for shr), but no corresponding utils or libs
>
Aargh, accidently sent the message before I could fix the layout of the files.
Anyway, I think the message is clear.

Frans


