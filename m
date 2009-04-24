Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LxTSe-0003Ln-JD
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Apr 2009 00:01:32 +0200
Received: by yw-out-1718.google.com with SMTP id 9so865380ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2009 14:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=IxxhtLYAtBYdn7L6ytJoEdflyoQGEY4iFC4vCR+KIbc=;
	b=jpb4efQ89PRzajLgeFpFop+DqZTAfylPHNB8udNuQTkKD32MyK/wU7XwOgEgXdfy5U
	C/Kfdo4FKWYPkPVxBSUOzF9MgzyjkKcAvLZspz+/enz4mpJptZw6cgm65zI43p++bVx9
	3FCfgcmXQbZ1SeGfI9YL2S7vUI9gzuSb+v2DQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=NJwtHvn4SvNG3iQ7CRHxF90399dqZCOZib9l3PgqvSEP44P0ybdADi/3qTSPlMVHSR
	GWj3rMETo49py97THZv66VrVhH+efovAH7sf7EvVenaeO4VLt8w4xpc3ZoH/ROfyPici
	hCKF1I1n0QAVHEqpZ3T2qIjLhVlcKgO94cIS0=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.151.8 with SMTP id y8mr3814184and.94.1240610205210; Fri, 
	24 Apr 2009 14:56:45 -0700 (PDT)
In-Reply-To: <49F1EFAD.30800@bolloretelecom.eu>
References: <20090424162257.54FFC1880DC@amethyst.openembedded.net>
	<49F1EFAD.30800@bolloretelecom.eu>
Date: Fri, 24 Apr 2009 18:56:45 -0300
X-Google-Sender-Auth: c4f3b16aa5e5bcca
Message-ID: <be7a9f3d0904241456k6540aad5n3d73d91e78b9bba7@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFtvZS1jb21taXRzXSBKZXJlbXkgTGFpbsOpIDogcXQ0LmluYzogYWRkIHRyYW5zbGF0aW9uIHBhY2thZ2VzIHRvIHRoZSBkeW5hbWljIGxpc3Q=?=
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
X-List-Received-Date: Fri, 24 Apr 2009 22:01:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Jeremy,

On Fri, Apr 24, 2009 at 1:58 PM, Jeremy Lain=E9
<jeremy.laine@bolloretelecom.eu> wrote:
> I have applied your patch but I don't seem to be able to change the patch=
's status to
> "Applied" in patchwork, no idea why..

The way you applied my patches is wrong.

In case minor changes are needed, as you've done in two of them,
usually we amend a it instead of doing a patch and put in the message
a credit reference.

This way we keep the credit to the author of the changes.

Just my 2c ;-)

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


