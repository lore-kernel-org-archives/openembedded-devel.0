Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1PFe3X-0002kE-5Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 03:35:31 +0100
Received: by bwz10 with SMTP id 10so6133715bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Nov 2010 18:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=klPGDVmbgXJ9SWZZfPEH4g8z63B8Zxh//chvg3OUJ10=;
	b=chKVHvjOZv+6ITf9hjanyEG5E7xSlKlwo5cIQlo1cr4W03c2H2jjmC/uMvpwGS8Vzu
	vs5cpzudLi4iMqrEdNV2wcqaICcZQZ9yDuEW43S3/ZARxGnuTFPE8wFqc8hZAXV1zRwm
	JNbxTVCuSz0Ww18nl+zcDcAEoMIIiDcKM+DXg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=vues6FgfsrHxxjmZZ70mQgBFON3Ch5JBT+8xRiHSLY63KFsaJvjOtywYA7eU4XOnva
	xmbVJizCnwTFq+DR1IAs7dyCZpdPmHgCD28m5Np1rA2h5m4XvUV5v0fz5hoRsz9oCLSK
	ziYf46xCfQ9wUY+YxtjNeLqPjPpAPvdrS3TMA=
MIME-Version: 1.0
Received: by 10.204.115.131 with SMTP id i3mr5035856bkq.208.1289270075881;
	Mon, 08 Nov 2010 18:34:35 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.2.75 with HTTP; Mon, 8 Nov 2010 18:34:35 -0800 (PST)
In-Reply-To: <AANLkTikVxU787_ktH03HKBdCCFiGZOvxXk6pJ94+RK6Q@mail.gmail.com>
References: <AANLkTikVxU787_ktH03HKBdCCFiGZOvxXk6pJ94+RK6Q@mail.gmail.com>
Date: Tue, 9 Nov 2010 00:34:35 -0200
X-Google-Sender-Auth: GZwLbHkmiAwdr67LqSBksuQv6vY
Message-ID: <AANLkTikpa=Q7Sfje-hGsPJ21TN8q_OdPsSBboBhwfA2B@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Fail to build eglibc on testing
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
X-List-Received-Date: Tue, 09 Nov 2010 02:35:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 9, 2010 at 12:31 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> I got this build fail. Anyone knows anything about it?

It used 'micro' distro and i586-generic.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 http://projetos.ossystems.com.br


