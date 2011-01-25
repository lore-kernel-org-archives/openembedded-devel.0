Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PhsLD-0006nq-6F
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 00:30:27 +0100
Received: by wyb40 with SMTP id 40so382092wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 15:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=m3KlfNwtMaUmSuCgysqJP2354yvWVWaJNzIQng+8r/k=;
	b=QMQbdTNyeINVZC0OZuEHrWK04P12gLPxUOtIWW1TRlJoinxMZ9W/Apk0bx8RQopq/Q
	JQFDpMC0vP+RTcXsDGfJFsiRakB+mjw5bC+DsGmizspjBiWbaWK47MXauKqrhgY71lCX
	2pH+j9dG0FlZ+rbi2UGCdM9QQ2o8dc+ADHNzM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dZLbkiNf4JVmihXWYKMAj7RMWJ11FK7g9As4CRIvt9/Bu+tUgBsM9tAupNmjnwWU+N
	Y7OktHEC9BIgMojZ2RoPLhIzc0awDIamPMAHPqc9O6Xv77NKcMqqH9mt4o6FXUd4dFKK
	794mRACW3z2Elf7P7I0ti853BJet4YMEikkJE=
MIME-Version: 1.0
Received: by 10.227.146.144 with SMTP id h16mr6618229wbv.221.1295998177431;
	Tue, 25 Jan 2011 15:29:37 -0800 (PST)
Received: by 10.227.151.208 with HTTP; Tue, 25 Jan 2011 15:29:37 -0800 (PST)
In-Reply-To: <ihmjnv$ufe$1@dough.gmane.org>
References: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
	<ihmjnv$ufe$1@dough.gmane.org>
Date: Wed, 26 Jan 2011 09:59:37 +1030
Message-ID: <AANLkTikH9pEQbBp8regqQwOvKVE=KDFUjvw_Z46aOnJo@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/9 v2] Replace ipkg-utils with opkg-utils
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
X-List-Received-Date: Tue, 25 Jan 2011 23:30:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 26 January 2011 00:08, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 25-01-11 07:25, Khem Raj wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> These patches replace usage of ipkg-utils with opkg-utils
>> in OE. I have built a native-sdk-image successfully on
>> angstrom-2008.1 and minimal
>>
>> Please review and provide your feedback
>
> For the whole series:
>
> Acked-by: Koen Kooi <koen@openembedded.org>
>

Yes, the second patch series looks sane to me.

Acked-by: Graham Gower <graham.gower@gmail.com>


