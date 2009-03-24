Received: from [74.125.44.157] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lm8rN-0000CP-UE
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 16:48:14 +0100
Received: by yx-out-1718.google.com with SMTP id 3so1791758yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=uePO4zun8v1fpvRgyaVvnM6TqHilfFdpWTl+pNjcWhk=;
	b=Zt0Tu5XCg0WtlFcpM3sz3zj9n4+sGGQY6y2ENBNLBllRV8Ck9NSlnR9w36Hq2Q/f3s
	/9Yg91/P9uPr1qsgGeyBk8hL1y9LFIZNEk9R9AQFsCVI1NjJJw8kQI9gKjgirXEZhnb1
	+RbPWQVEr15SP9ngEjNr0bjEvmDuTIATQHuP4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vGjWXB7eBLrHO9+9ENHABG1fAdtEXI1XJuTm6o6ArnJH3M2YxCKE6lHiEcNxKX5i8K
	tD5sEefqiq/67r6Mi8GrfU7lESObBWMhl9Rgm+Cf1Fjiz7Qy0Qghhp1vkPMTZMsfA6wN
	lOjQ6w41r3qukwjpsKdhYw8cbDLKogF/speNM=
MIME-Version: 1.0
Received: by 10.150.153.7 with SMTP id a7mr13966613ybe.150.1237909604731; Tue, 
	24 Mar 2009 08:46:44 -0700 (PDT)
In-Reply-To: <873ad462xj.fsf@neumann.lab.ossystems.com.br>
References: <873ad462xj.fsf@neumann.lab.ossystems.com.br>
Date: Tue, 24 Mar 2009 11:46:44 -0400
Message-ID: <f96d234e0903240846s37d4bc77lfe7b31a4d6806262@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Problems with current workflow using PatchWork
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
X-List-Received-Date: Tue, 24 Mar 2009 15:48:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2009 at 4:47 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> Today I went to take a look if there were anything I could help with at
> OE side and went to PatchWork to review pending patches and noticed a
> cuple of issues.
>
> =A0- we need to do more review cycles at PatchWork and update the status
> =A0 according
>
> =A0 There're applied patches that were not archived and patches that we
> =A0 asked for changes that hadn't the status changed to reflect it. This
> =A0 way PW loses the main feature that is trackability of patch status.
>
> =A0 Please commiters, when doing a commit please remember to archive the
> =A0 patch at PW.
>
> =A0- merges need to be archived on PW
>
> =A0 I noticed tha the RPM fixes went finally merged into the
> =A0 mainline. GREAT! But they were still listed as waiting for
> =A0 review. Since Marcin has commit, he did the merge but forgot to
> =A0 archive the whole set of patches at PW.
>
> =A0 I suggest we when commiting our own patches take care of archiving
> =A0 them at PW to make life easier to everyone.

Makes sense to me.  I have been archiving patches as I apply them, and
selecting "Accepted".

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


