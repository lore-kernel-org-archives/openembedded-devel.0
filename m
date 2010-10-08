Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4JpG-0001rT-5A
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 22:45:59 +0200
Received: by iwn7 with SMTP id 7so129543iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 13:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=d8h3lGJ6eDKRyyZ/DutJRT/mQ8w7KaKnyaPrnj4jHPA=;
	b=lt4zmK0AWbbODqP8tC8/GYI5qMfrB5J9m9+9cFNiRUp4eKcbRqGQxhza9A0U4siWGG
	eFKZOvPlP8F7ACHswQKtAJabtDTPt7iq2F3Ub+dBrDLAPWaV6IvYldjGUy1t7suB9Die
	0PVizW8NqmrpkuS75swNfDQVTpdO6l4ew43Hs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NsSWZwrepW3ruWXt7pPlvMzY0bZS7kGdx0VhNlDt0hozYseulOyPiLG3pDwpNEgq1s
	MnJMvGu2X5tXnm6wvki04Jwfi64jcmTZzXoWZ0Dt3ZzFXU0dHiJdECtr4e68v4l6tFaO
	EZyIgzKMeVvGgy5GhcHKDHmQszMeuy6czP/Os=
MIME-Version: 1.0
Received: by 10.231.157.207 with SMTP id c15mr2644307ibx.143.1286570733438;
	Fri, 08 Oct 2010 13:45:33 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 8 Oct 2010 13:45:33 -0700 (PDT)
In-Reply-To: <AANLkTin=ucR4=4zJQg=thwRbqehhCzRa-DE6NwCGb76R@mail.gmail.com>
References: <AANLkTin=ucR4=4zJQg=thwRbqehhCzRa-DE6NwCGb76R@mail.gmail.com>
Date: Fri, 8 Oct 2010 22:45:33 +0200
Message-ID: <AANLkTinJ1TJpALn5XFwQwAyua6smuGtabu7H9==RWh5w@mail.gmail.com>
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
Subject: Re: recipy_sanity experiment
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
X-List-Received-Date: Fri, 08 Oct 2010 20:45:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> =A0 =A0 11 RRECOMMENDS should be RRECOMMENDS_${PN}

Did some further analys on these. They are all from ttf and the
rationale for it is given in ttf.inc.

Also fixed the one wrt DESCRIPTION

Frans


