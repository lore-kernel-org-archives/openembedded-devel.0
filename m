Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LyyrD-0003Yd-86
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 03:45:08 +0200
Received: by yx-out-1718.google.com with SMTP id 36so586413yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 18:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=xqtQzDweTrv9M9UQ9r3/oHyJUlvlRcPRc0FICETZN9Q=;
	b=khTpbt2ChlZGp/pru2sMDjFD1XzKwtelAEcA8x0wG8NFgOICwyv5sxKRrcrOIoE20Y
	oHDGdC23nguPkypeR+LOpN3C2adp7H+EYEzCtTSX1gG3B3okpiyHNQE2hjkTvX2KwEEs
	ATRtmcF5IBQnMolnHC25wH90VmzR6X6JjZFgI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=WKryd++8A0qx3u/dKLLxRBjddrwzVujO1dWkkkdsMC+UC1t2bdFKX31bkvJaClAZcl
	X/hsNrV/JoBB1x1LIkWoJKlpewz/zK+K6L6fpGhhuAqU6ptNL7eD8ESXqDT4UyhcVnaE
	K8njHXsYyZjlunDTK68K2jSqoNDvKO69zRJ20=
MIME-Version: 1.0
Received: by 10.151.72.6 with SMTP id z6mr332112ybk.186.1240968751035; Tue, 28 
	Apr 2009 18:32:31 -0700 (PDT)
In-Reply-To: <3323840366.282325@smtp.gmail.com>
References: <3323840366.282325@smtp.gmail.com>
Date: Tue, 28 Apr 2009 21:32:30 -0400
Message-ID: <f96d234e0904281832u1bd7fed4qd6dd48166da935e@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ka6sox@gmail.com
Subject: Re: Hosting OE services
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
X-List-Received-Date: Wed, 29 Apr 2009 01:45:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Rod is providing access to the machine, so I'll report back tomorrow
once I take a look at it.

OSUOSL hosting provisions seem very generous, and Rod's experience has
been great, so this seems like a very attractive offer.

Thanks,
Cliff

On Tue, Apr 28, 2009 at 7:28 PM, Rod Whitby <rod@whitby.id.au> wrote:
> The nslu2-linux project has previously offered a virtual xen instance on =
a powerful and well connected machine at OSUOSL for hosting OE services.
> Mickey took up the offer temporarily when the main OE server went offline=
 temporarily some months ago.
> The offer still stands - the instance we used then is still active.
> Core team members please contact myself and Tom King (ka6sox) for details=
 either on email or IRC.
> -- Rod
>
> -----Original Message-----
> From: Philip Balister <philip@balister.org>
> Date: Wednesday, Apr 29, 2009 6:58 am
> Subject: Re: [oe] [oe-commits] Koen Kooi : Revert "ecore: catch up with t=
he =A0new SONAMEs; move to autosplitting"
> To: openembedded-devel@lists.openembedded.orgReply-To: openembedded-devel=
@lists.openembedded.org
>
> This is a cryptographically signed message in MIME format.
>>
>>--------------ms060305030306050807040902
>>Content-Type: text/plain; charset=3DISO-8859-1; format=3Dflowed
>>Content-Transfer-Encoding: 7bit
>>
>>Phil Blundell wrote:
>> On Tue, 2009-04-28 at 14:23 -0400, Cliff Brake wrote:
>>> On Tue, Apr 28, 2009 at 10:41 AM, Phil Blundell <philb@gnu.org> wrote:
>>
>>I think people are going two different directions. Mickey has resigned
>>from the eV board and said we need to replace him on the eV board. Also,
>>we need to make arrangements for hosting the OE services. Obviously,
>>we'd like the hosting responsibility moved to the group, and not be
>>dependent on individual generosity. This is as good a time as ever to
>>resolve the few remaining eV issues.
>>
>>Philip
>>
>>--------------ms060305030306050807040902
>>Content-Type: application/x-pkcs7-signature; name=3D"smime.p7s"
>>Content-Transfer-Encoding: base64
>>Content-Disposition: attachment; filename=3D"smime.p7s"
>>Content-Description: S/MIME Cryptographic Signature
>>
>>MIAGCSq
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


