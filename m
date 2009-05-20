Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M6sh0-0005jt-PS
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 22:47:14 +0200
Received: by yw-out-1718.google.com with SMTP id 9so379175ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 13:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tnRJPvUyUV2ONZRrIC4OtVDPdxYQojmu7b/TclAH38E=;
	b=ARNFlb3akcrjlv9768nbIXOz/JfnHtOJxZxfs7e9pJMUj+RAVyrLxVaUPx7iNm0CfN
	c+oxmoKr0FYLAT8HbJyI0O6G1N0x8hdqnZ4iSCzUmYJCEd6m3vGJ5Oun56Kdc/rTx42i
	67isUcklTPr0DZ+GPHiZlI/9LJO/1Kf8kY4gQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EfUHonYPq9m/37sS5W5kQIjyKsJ8LvbOir9rwdEtfutYOvk06UkfubNzBmMAbe5BXM
	luOxninoPhJmoVFG3yjBusV6MAo+ewwYhpuKfy5B52g01oqLGhrrYcorV6LtkEtpODof
	mh4VJ2BIIw+MYorJWbqL2fVZzFbN1yoGunCr0=
MIME-Version: 1.0
Received: by 10.151.98.17 with SMTP id a17mr3347003ybm.302.1242851563083; Wed, 
	20 May 2009 13:32:43 -0700 (PDT)
In-Reply-To: <f96d234e0905192000u56f4dfa7m2f9f4d38ee8a2107@mail.gmail.com>
References: <f96d234e0905192000u56f4dfa7m2f9f4d38ee8a2107@mail.gmail.com>
Date: Wed, 20 May 2009 16:32:43 -0400
Message-ID: <f96d234e0905201332tbb3a548nad7a82c18e32c59d@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: reminder git move to OSUOSL Wed (PLEASE READ)
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
X-List-Received-Date: Wed, 20 May 2009 20:47:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

http://new.openembedded.org/cgit/
git://new.openembedded.org/openembedded
git@new.openembedded.org/openembedded

The above should now work as soon as DNS changes propagate to your
machine.  New machine IP address is: 140.211.169.165

You will see the WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED! if
using ssh, please remove entry as the ssh keys have changed.

notifications to IRC seem to work.

notifications to the maillist do not.

Florian, can you check the openembedded-commits setup, and see what is goin=
g on?

this is from my mail log:
2009-05-20 20:24:32 1M6sL1-0001OY-Nl <=3D git@new.openembedded.org U=3Dgit
P=3Dlocal S=3D1219
2009-05-20 20:24:32 1M6sL2-0001Oe-4V <=3D git@new.openembedded.org U=3Dgit
P=3Dlocal S=3D1067
2009-05-20 20:24:35 1M6sL1-0001OY-Nl =3D>
openembedded-commits@openembedded.org R=3Ddnslookup T=3Dremote_smtp
H=3Dopenembedded.org [85.214.40.226]
2009-05-20 20:24:35 1M6sL1-0001OY-Nl Completed
2009-05-20 20:24:48 1M6sL2-0001Oe-4V =3D> cia@cia.navi.cx R=3Ddnslookup
T=3Dremote_smtp H=3Dcia.navi.cx [208.69.182.149]
2009-05-20 20:24:48 1M6sL2-0001Oe-4V Completed

I suspect they are waiting for moderation, or something as the cia one work=
s.

I still need to sort the gitweb forwarding as well.

Let me know of any other problems.

Thanks,
Cliff


On Tue, May 19, 2009 at 11:00 PM, Cliff Brake <cliff.brake@gmail.com> wrote=
:
> As announced last week, baring no major problems, we plan to move the
> git service to OSUOSL Wed, 2009-05-20 @ 1900 UTC (3PM EDT). =A0The new
> server can be tested/accessed at:
>
> http://new.openembedded.org/cgit/
> git://new.openembedded.org/openembedded
> git@new.openembedded.org/openembedded
>
> The server will likely be off-line for up to 2 hours while changes are
> made and DNS entries propagate.
>
> The original URIs will take effect then on the new server:
>
> http://cgit.openembedded.org/
> git://git.openembedded.org/openembedded
> git@git.openembedded.org/openembedded
>
> Note, the .net versions may or may not follow depending on Mickey. =A0At
> any rate, the TTL for the .net entries are 24 hours, so it will take
> some time for them to catch up if they are changed.
>
> Please use the *.org URI's going forward. =A0The wiki and documentation
> have already been modified to reference the *.org URIs.
>
> Thanks,
> Cliff
>


