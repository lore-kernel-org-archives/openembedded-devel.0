Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LpQ4W-0002Fh-KC
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 18:47:53 +0200
Received: by qyk30 with SMTP id 30so1217887qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2009 09:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=mhbNAKzmMoonphmIMfwcJ5zAx+usbitdrbfeMS3tcYk=;
	b=OnqAvGF8Yz3SpXaW1W6mL6EtHUOZw5FHYT8TvT9e5/X8lMqOdKmXcdQJzr8xrovnEF
	d0ZvjZ9zOWi4RLv3fCK7R6YRLWBZd6gF5WQsWANDOVe4nExUG+oGDzjR1847RjXVRk4E
	aJvuPvIZq7wzQRQa2viDBX6YDIs+p1OUk9/+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=BE1LiTU2Dd1rWTN6Z46iTox3T0LpEWi5SPe6lNBAdosStjULRKxrSXM5ZQ2ioVTycR
	7YuIwm/PiGKOLGBKN0GaTQg+DvFaiuOGmiU6Y3t7W/XGhtt3Diqy4f8jdtYyviOSenET
	wHgOdkPoo/YN4nz+QMZUYlh2bnQKuXl6S+IVs=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.231.10.140 with SMTP id p12mr70856ibp.50.1238690692423; Thu, 
	02 Apr 2009 09:44:52 -0700 (PDT)
In-Reply-To: <49D44D76.7070808@bolloretelecom.eu>
References: <1238607343.27167.1.camel@homestead>
	<49D44D76.7070808@bolloretelecom.eu>
Date: Thu, 2 Apr 2009 13:44:52 -0300
X-Google-Sender-Auth: 3f4a7cb6a7270bcd
Message-ID: <be7a9f3d0904020944h4d4c6d6dgac1a2e75163d8cf3@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.124
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cmake
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
X-List-Received-Date: Thu, 02 Apr 2009 16:48:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2009 at 2:30 AM, Jeremy Lain=E9
<jeremy.laine@bolloretelecom.eu> wrote:
> Shane Dixon wrote:
>> I'm considering changing my projects over to cmake, but before I do, I
>> wanted to ask how good the cmake support is in OE. =A0I saw a recent
>> proposal to allow out-of-tree builds for cmake, but I'm not sure if that
>> happened or not.
>
> At work we recently switched our projects over to CMake and they are buil=
ding happily in
> OE. Out-of-tree builds are indeed supported, see recipes/llvm/llvm.inc fo=
r an example.

What do you mean by out-of-tree?

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


