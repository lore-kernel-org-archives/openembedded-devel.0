Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1Oec5U-00035K-6d
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 01:00:29 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id BDA6243D38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 01:00:09 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz BDA6243D38
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1280444409; i=@fjfi.cvut.cz; bh=inbIDh7TC2KVLpovVVzwVp7DgHQ=;
	h=Date:From:To:Subject:In-Reply-To:Message-ID:References:
	MIME-Version:Content-Type;
	b=hpWowQHGb9crvGjRV25EIKaQWo45hu1sjFiSU7xYZfsMMka8/gD7b7COA8fG1X5vt
	krsw3YeqSKJQoa/2FQ5Hw==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id vMNCe6FjOJvd
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 01:00:04 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 8257243D37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 01:00:04 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 8257243D37
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz 8257243D37
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 00B8946774; Fri, 30 Jul 2010 01:00:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by linux.fjfi.cvut.cz (Postfix) with ESMTP id DFC7D46773
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 01:00:03 +0200 (CEST)
Date: Fri, 30 Jul 2010 01:00:03 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTika1u_edyHhi2GepQxxcAnMqnJVDjBfMLNFsH53@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1007300053230.28782@linux.fjfi.cvut.cz>
References: <20100727010733.3AE504677C@linux.fjfi.cvut.cz>
	<AANLkTika1u_edyHhi2GepQxxcAnMqnJVDjBfMLNFsH53@mail.gmail.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] webkit-efl: update to recent webkit-efl (r64079), package launcher too
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
X-List-Received-Date: Thu, 29 Jul 2010 23:00:29 -0000
Content-Type: MULTIPART/MIXED;
	BOUNDARY="546533125-1259393630-1280444403=:28782"

--546533125-1259393630-1280444403=:28782
Content-Type: TEXT/PLAIN; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Jul 2010, Eduardo Lima (Etrunko) wrote:

>> +do_unpack_append() {
>> + =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func('do_move_files', d)
>> +}
>> +
>> +do_move_files() {
>> + =C2=A0 =C2=A0 =C2=A0 mv "${WORKDIR}/cmakeconfig.h.cmake" "${S}"
>> + =C2=A0 =C2=A0 =C2=A0 mv "${WORKDIR}/CMakeLists.txt" "${S}"
>> +}
>> +
>
> Instead of custom do_unpack_append I simply put a OECMAKE_SOURCEPATH =3D
> "../", which makes the recipe cleaner, IMHO. But that's just the
> opinion of a newbie in the OE lands. :)

I agree your approach makes the recipe simpler. On the other hand, my=20
approach keeps WORKDIR cleaner. (Yeah, who cares about WORKDIR. But havin=
g=20
sources in a single dir instead of all-over-the-place mixing with logs an=
d=20
package seems nicer to me.)

But overall it's not much of a difference IMHO, so as the submitted=20
version works, I'd prefer to keep it. If there are strong preferences for=
=20
OECMAKE_SOURCEPATH then I have n/p with changing that, though.

Regards,

David

--546533125-1259393630-1280444403=:28782--
