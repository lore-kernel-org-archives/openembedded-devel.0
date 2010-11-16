Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIUJd-0003iH-N7
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 23:47:54 +0100
Received: by gwaa11 with SMTP id a11so807941gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 14:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=X9BNcyRLelckpI3Qdz+IPfnDv+vNOgqaivFJ6xPUvRI=;
	b=Z4wjFKxnhSUsIZcN2eQQ49eaWKlZGeHhdVFUWa2vnzoVjCBkm5o8KTuiOPey4NO7Rq
	maas7nVv7wBbHguHTjCzKdVzKSlNUOinH1wTn1pLD+hYnQzj1sEnjycEefc0aJymNXzc
	GN1ma0z+JStQOeAtEGJD/mDS4hD6mKVSOiuM4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=iJoPwajW+mlCGtOffcf1PuOPcsZ53l//ZcADK/SHsUXUi4HEc6slUGzWhpPmJ7tXdi
	ZhAN5QmCYPgJWcR1Kk9igFYxV0WYyHPuuhv4h818/RAnKHTBP+PCB01DwdgleMts5LNm
	25JFTAgxEqtYJHDdLuW1RUVVVETMcSejIFwgc=
Received: by 10.91.121.3 with SMTP id y3mr4292691agm.156.1289947607443; Tue,
	16 Nov 2010 14:46:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 14:46:25 -0800 (PST)
In-Reply-To: <1289947184.11873.3.camel@mattotaupa>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<1289947184.11873.3.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 14:46:25 -0800
Message-ID: <AANLkTinuJ6bx+iHNq-4VLKNkaHbwaPitm7f6hZ=VM9az@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Tue, 16 Nov 2010 22:47:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2010 at 2:39 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> Am Dienstag, den 16.11.2010, 10:20 -0800 schrieb Khem Raj:
>
>> In order to get to the 2010.12 release, I would like to request to
>> stop pushing any changes to master until release. Please keep your
>> changes in you local tree ready for when the window
>> opens again after the release.
>
> would it be a good idea, to either have each developer with commit
> access create his/her own =E2=80=9Cnext=E2=80=9D branch or to have a comm=
on next branch,
> where those changes could be published, so that work is not duplicated?
>

Either way is fine. If its posted to mailing list then it goes to
patchwork and after approvals I will sweep them
if devs publish a pull branch thats ok too.

> [=E2=80=A6]
>
>
> Thanks,
>
> Paul
>
>
> PS: Khem, thanks for taking the lead in getting this release done!
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


