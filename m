Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PcL8K-00015g-CR
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 18:02:16 +0100
Received: by bwz10 with SMTP id 10so18471841bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 09:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=t/q759jnzMlXSoJ8FtBBs5EU7GVQPzgxawNMq466UOY=;
	b=IGl5TQMSOLho5KXISaWRWrhSk5AcqoikT/cCVpCoBBrp2vrAwWaW9QhUIR2Hwu5qkJ
	kSvFlSwQ0ro1Xyoma1zXeTGY3FrVC4Eyv+ZusCmqoyzeSqmNnIEAkYhwV601bw1yO8mL
	RSj8l9au5w1iARnRT0G7bGOoqwdPCILcp3vao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=BV5Y3LN9uBxQihWl5xXLdS1EVpr5FL8YppTkhe0stoYzNPvt8ZHI6+r/jyuSkYWm8N
	blpvlmx8njntPl5P10GLVh82XHmqAhDTCgTuX5AUjCB+px6T5nyRNOcaNt/QrY+BVaVu
	Ng8MDCch587Bh82A5qSn5rzGiOHHxTWSdzptM=
MIME-Version: 1.0
Received: by 10.204.122.68 with SMTP id k4mr10154688bkr.153.1294678908129;
	Mon, 10 Jan 2011 09:01:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Mon, 10 Jan 2011 09:01:47 -0800 (PST)
In-Reply-To: <20110110163432.GF3244@jama>
References: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTik6N-zh9_o819ipEyu7-k3k5Nt24+GbVTg0q24n@mail.gmail.com>
	<AANLkTimea7_8xcgXXb751V_Jhk_q9GP7VAUcEupGUrGW@mail.gmail.com>
	<4D2B3303.4000008@mentor.com> <20110110163432.GF3244@jama>
Date: Mon, 10 Jan 2011 15:01:47 -0200
X-Google-Sender-Auth: bvuqMS8aJKmij7yomhJQrfYWVyE
Message-ID: <AANLkTimPnwacZWNmThDgtf43Revay=a7sT2HKfcke6--@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] xorg: upgrade to X11R7.6 and remove preferred-xorg-versions*.inc files
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
X-List-Received-Date: Mon, 10 Jan 2011 17:02:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2011 at 14:34, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Jan 10, 2011 at 09:25:39AM -0700, Tom Rini wrote:
>> On 01/10/2011 05:20 AM, Otavio Salvador wrote:
>> > On Mon, Jan 10, 2011 at 06:31, Martin Jansa<martin.jansa@gmail.com> =
=A0wrote:
>> >> Or just push and see who complains? :/
>> >
>> > +1
>>
>> +1
>
> can I sed 's/+1/Ackey-by you 2/g' ?

Please do! :-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


