Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Luooj-0001us-Dp
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 16:15:00 +0200
Received: by gxk18 with SMTP id 18so2205351gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 07:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=uWKH0AogQwZMxctnjby7ZZoUamzIAtCb0ukdVwwaDJk=;
	b=t9UIelS4wsHkT0NT6An2BFdJkuLPQ9pAZxGmT0QUi3rNs/n2ccMsRNZyDNJBMc5PrI
	Aap4pcqrQbRJQ/7osjUUxYxORQy+3jwK7txyFs4Co5HLD09VV35ly7pL/FigZSjo2WHp
	BzvGaPDkX6z6EgDSTnPlCi/EXqwUdweTFKas4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=OliEKvTXjjDYEwIKYJ1kjmL46thKz8dc2Df2OxsrSMU0Jh8t/A7SqA0x0hPXnkV5tt
	FE6c0SZlyouDF7JC/HBNfS/qfLNhyiCFsa/TVJ2WEr/mYJ/s+VaVv95ZxyzysarXfsR2
	9bzognbIh0xum3p9n1r2LknjJ6O8sg51ehVm0=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.232.15 with SMTP id e15mr3801928anh.129.1239977359224; 
	Fri, 17 Apr 2009 07:09:19 -0700 (PDT)
In-Reply-To: <1239948775.4599.12.camel@faraday>
References: <1239948775.4599.12.camel@faraday>
Date: Fri, 17 Apr 2009 11:09:19 -0300
X-Google-Sender-Auth: 10e9f35af38f5115
Message-ID: <be7a9f3d0904170709p59ad1833qb56ed8d7558783bf@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.170
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Add missing file to ipkg-utils
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
X-List-Received-Date: Fri, 17 Apr 2009 14:15:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Marcos,

On Fri, Apr 17, 2009 at 3:12 AM, Marcos Amorim <marcos@2mi.com.br> wrote:
> The arfile.py is required by ipkg.py but not was install

NACK!

Your patch is right but the comment you've used doesn't make clear
where it is acting. Please amend your patch and send it again
with an improved comment.

Besides that it looks ok.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


