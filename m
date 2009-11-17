Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NASBv-0006bA-RH
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 18:50:14 +0100
Received: by fxm1 with SMTP id 1so235686fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 09:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=aDxZlyZhWJLsA/w0j9CTUsffwDxwDJJBrEN8Qqp/dE4=;
	b=POR+AnIOgHir+DOxVqdWFdP/AdmO5IAuMRopFB5ue3/vrjrKX3KjHjrirW6K7a/1O9
	QPiHNTEtGDqDSvpuny/T5E7DwsDDJMdsKJBuaSbWDHi5uEN2o8pVtXvyLdtQCQweZ5eh
	2CjXLAlWo/sBecyT/3OQPisXX7jtptT0IRK5Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OuCDOO6NPJWu/A4YLb/h5r4ISww54iYWKjeuLhEWGt/4q6cRed0mpTG6aSVh7wxs2Y
	yoMcJX3xxI1cVVROM7Iya8OLsHoC0gUB/IEq0ya6+idXnqR0YpxIwisbNr0DhNTeEMzo
	8aqalxQdmy4g50aln5BEw9511H/qjflPzIr3w=
MIME-Version: 1.0
Received: by 10.216.90.76 with SMTP id d54mr1134085wef.55.1258480128520; Tue, 
	17 Nov 2009 09:48:48 -0800 (PST)
In-Reply-To: <1258476039.1078.33.camel@localhost>
References: <1258476039.1078.33.camel@localhost>
Date: Tue, 17 Nov 2009 12:48:48 -0500
Message-ID: <f96d234e0911170948i53bded13i64db5531ad6c3e51@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Docs and Bug tracker migration to OE from bug for OpenEmbedded tools for Eclipse
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
X-List-Received-Date: Tue, 17 Nov 2009 17:50:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2009 at 11:40 AM, Ken Gilmer <ken@buglabs.net> wrote:
>
> Hello ~
>
> =A0I'm thinking it might be more appropriate to have information
> regarding OTE
> (http://community.buglabs.net/kgilmer/posts/110-BitBake-Commander-6-8-Ins=
tallers-) on the OE wiki rather than the bug labs community site. =A0The pl=
ugins are independent from any BL product, and it may serve the community b=
etter to have this tool more closely associated with OE. =A0Maybe also defe=
ct tracking might be better suited in the OE bugzilla. =A0Comments/concerns=
?

Seems like a good idea to me.  This information in the OE wiki would
be welcome from my perspective, and would likely get more exposure.

Regards,
Cliff


