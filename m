Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kartikmohta@gmail.com>) id 1Q2Ajk-0005pw-OM
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 00:11:40 +0100
Received: by iyb26 with SMTP id 26so8285367iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 16:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=uKdo5s3khFPzFq55JA93WRFATIsFXBSyXr+3LFpMV9s=;
	b=RvC0ikOf2igGL9Irp3XaiQSn9jGhZZ6b+SuPDrBQCTuEmwpDPA6O8ZvtdsNIEShYMJ
	2bbdHWgQczyRs5ZaZE/O+6gQ3FfopErLuZLpV8fsR1oj63kHB2Z6xCJplaDSZsDl1h5l
	wF+vE0GAZF5/YV+YBpYq6PClafczVVk/PAyqA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gYZHVBdW5LnHMNu45fRnv0lKGAqLZlYKQjoETIQ7bsKpGL7cTMFSb/NFZUlkPh9Usg
	7357zVUR5PDjGuQ6k/ww4cuuLZqXz9H67PjuWSlMBZmg6K+Jpo2g2I9AVnbrJYSAXV6H
	kNsFPzlSJ0CY9oGjRq9dwbzmQ8jpufnhyLVTM=
Received: by 10.42.153.3 with SMTP id k3mr9736817icw.457.1300835389171; Tue,
	22 Mar 2011 16:09:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.219.132 with HTTP; Tue, 22 Mar 2011 16:09:29 -0700 (PDT)
In-Reply-To: <20110322230513.GD13076@sakrah.homelinux.org>
References: <1300833106-28370-1-git-send-email-kartikmohta@gmail.com>
	<20110322230513.GD13076@sakrah.homelinux.org>
From: Kartik Mohta <kartikmohta@gmail.com>
Date: Tue, 22 Mar 2011 19:09:29 -0400
Message-ID: <AANLkTi=VgybZru4r2B6vt=EGz8=LyNFXD78m3SHPuPiu@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libarchive: Requires libxml2
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
X-List-Received-Date: Tue, 22 Mar 2011 23:11:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2011 at 7:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (23/03/11 04:01), Kartik Mohta wrote:
>> Signed-off-by: Kartik Mohta <kartikmohta@gmail.com>
>> ---
>> =C2=A0recipes/libarchive/libarchive_2.8.4.bb | =C2=A0 =C2=A02 ++
>> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
>
> Why did you resend it ?

Sorry for that, it took a long time to appear on patchwork so I
thought there was some problem in the original submission.

--=20
Kartik


