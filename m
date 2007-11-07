Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IpizR-0007qz-5q
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Nov 2007 12:22:33 +0100
Received: by fk-out-0910.google.com with SMTP id 18so2321510fks
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2007 03:21:42 -0800 (PST)
Received: by 10.82.124.10 with SMTP id w10mr14332890buc.1194431168606;
	Wed, 07 Nov 2007 02:26:08 -0800 (PST)
Received: by 10.82.118.8 with HTTP; Wed, 7 Nov 2007 02:26:08 -0800 (PST)
Message-ID: <74d0deb30711070226u29479070te5f20880b1616aac@mail.gmail.com>
Date: Wed, 7 Nov 2007 11:26:08 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1IpXlZ-0004u8-1Y@linuxtogo.org>
MIME-Version: 1.0
References: <E1IpXlZ-0004u8-1Y@linuxtogo.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev rm_work: only remove ${S}, leave temp and install alone
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Nov 2007 11:22:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/7/07, koen commit <openembedded-commits@lists.openembedded.org> wrote:
> rm_work: only remove ${S}, leave temp and install alone

Why? Leaving image/ and install/ alone seriously decreases rm_work's
space saving powers.

regards
Philipp


