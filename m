Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N7uOE-0008Dd-LY
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 18:20:25 +0100
Received: by fxm1 with SMTP id 1so236013fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 09:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5HjPM6ZDMYucoKCqOnBZ6+B/H/188RjE8PZ7Ds6zNeg=;
	b=meXIDCPCFgSZ9Fgbp+j3/qD8aa3arVqr8/TcimexlVL5KwegiO5iHxaR4xGfFRDvLK
	qZET2N4pz7TlgwOoksUfwQHRYyNWCjk52ENIGQuiZv/r6yVoMtGYSP+w6a+pss8+sWtL
	niwf0q4DffJPeZqUXmmd2cvZ/zm9yAygJ4MIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=cLfGqUBKuYCIAJx1LTrVuv3cv0foxouSFB8zPlbQGCHeVi8QJY1DSFCXZXlz+Kc84/
	tn+71ZX+5LLL4kcg/fPZRwnZd8zzO2V7rOKeLgZsUVXEceuIRmED5L5CX+uy/iPr5U9v
	yA7GU/7CxkUD820a03MVjmbRZe6UPdGsH4p0c=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.170.28 with SMTP id q28mr32445hbe.149.1257873545188; Tue, 
	10 Nov 2009 09:19:05 -0800 (PST)
In-Reply-To: <be7a9f3d0911100914o45d3526fufb4338966b9cdc33@mail.gmail.com>
References: <1257858446.3077.3.camel@opal>
	<20091110132756.GC3998@excalibur.local>
	<1257864635.5228.17.camel@opal>
	<20091110151412.GF3998@excalibur.local> <1257868356.5472.1.camel@opal>
	<be7a9f3d0911100914o45d3526fufb4338966b9cdc33@mail.gmail.com>
Date: Tue, 10 Nov 2009 15:19:05 -0200
X-Google-Sender-Auth: 53d22e8e1b5b877b
Message-ID: <be7a9f3d0911100919y1ef9f5c5yc70513581e1f816f@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OEDEM: Summary of 'OE and Poky', 'Hosting', 'Bugtracker'
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
X-List-Received-Date: Tue, 10 Nov 2009 17:20:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Nov 10, 2009 at 1:52 PM, Michael 'Mickey' Lauer
<mickey@vanille-media.de> wrote:
> Sorry, this might have been unclear on my part, it's just different
> projects on the same repository, not different repositories. We'd like
> to and recommend OE developers to host their branch in a 'contrib'
> project on git.oe.org.

I see no point in having a contrib tree with many users on it; I much
prefer to have a by-user tree and then allowing them to do whatever
they want on this tree.

If someone needs to contribute on a tree, he can fork it and make it
available for pulling. This is the easiest way of starting to =A0"train"
people to get used to the pull-model.

A simple solution might be to use gitorious for oe as being done in
qt; that avoids the admin hassle and provides more user friendly
interface for it.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


