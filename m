Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RYPbA-0003io-53
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 23:04:20 +0100
Received: by bkbzt4 with SMTP id zt4so1032285bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 13:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ggt0W6SFZmddX+buXntnB8ne6yZjtMGgl//isHAFd3w=;
	b=AoK+ettFVBbWeb8Ey1CDHwgb1mHfs2cn0rlRYQgg+HWBQM9gl96zFV5gCreTtNzu50
	Xm5y0YOBQqd5Hq3T6NbgXb0hfmxcHM+FswFZpPz5nT45Fdjjsg1pY4lrpY0Neyf+wDNz
	uERhlmj0oKd8mlK4ZK9N2DXs/pPNhgNQKJgd8=
MIME-Version: 1.0
Received: by 10.205.139.7 with SMTP id iu7mr269890bkc.83.1323295050859; Wed,
	07 Dec 2011 13:57:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Wed, 7 Dec 2011 13:57:30 -0800 (PST)
In-Reply-To: <4EDFE090.6010101@linux.intel.com>
References: <cover.1323292658.git.otavio@ossystems.com.br>
	<602892cc30a9872388e3e116d7eea691ebafe034.1323292658.git.otavio@ossystems.com.br>
	<4EDFE090.6010101@linux.intel.com>
Date: Wed, 7 Dec 2011 19:57:30 -0200
X-Google-Sender-Auth: NW4iZ_th8rr1s-onwXAc_q2lC4I
Message-ID: <CAP9ODKqBh=nO3eg1_Cdt12cX1ozAixpV2RMw7-vQ6PgH=ow8iQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/1] connman: update to 0.78
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
X-List-Received-Date: Wed, 07 Dec 2011 22:04:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 7, 2011 at 19:54, Saul Wold <sgw@linux.intel.com> wrote:

> On 12/07/2011 01:18 PM, Otavio Salvador wrote:
>
>> We moved to GIT repository as the tarball releases are not available
>> since kernel.org compromise.
>>
>>  Any reason this can't be updated in OE-core?
>

Sure not; for it I'd need to test connman-gnome but I don't have the
required time to do that.

As far as I know the xuser patch ought to apply fine but others might need
checking.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

