Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShwRj-00036Y-A7
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 07:30:15 +0200
Received: by eekd49 with SMTP id d49so440105eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 22:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=qf7XINjmKU84x2UAl+YAmC7PkZ3l8Z4vH+Enf/5SB3A=;
	b=NOh8gsILFD7qNFE4cZUyN7Z5K1oHKmRLfNZ9n1lHMC7wdsFoG2LJ6a57dBvkZbPJZK
	zFj/6oBb4JP3QSfu+iTZd4dUgx3UV6DChTspJ6MkMX1bLuBXKe5fdXx02Jep4wLG0LlY
	UCRgHiuUZrtrzHl5N4usKXP/KFe9yMgg09CjWbnfG2KGoBusVSdAjN17KpLGWRZZFfGz
	NadApbxCGZSBbzjvNEd6s1hIvWv0nxmOfXcpwtuBz/LdXYNdexNoJ73ipDZtT2AnZYKj
	6g2tSX0J6q3dB09EopTV7OTsJQpedRu2m2szSUxb7n8/Q0NuuA5tkc+AYSqpbQVvVSdg
	bSmw==
Received: by 10.14.185.137 with SMTP id u9mr149728eem.220.1340342368659; Thu,
	21 Jun 2012 22:19:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Thu, 21 Jun 2012 22:18:58 -0700 (PDT)
In-Reply-To: <519612C8-8937-44B8-B0B5-0B0F032937A3@gmail.com>
References: <1340338450-23907-1-git-send-email-elvis.dowson@gmail.com>
	<4FE3F482.50506@gmail.com>
	<CC9E678D-B16D-472D-9896-2DDA3E23CB19@gmail.com>
	<4FE3F884.1070403@gmail.com>
	<519612C8-8937-44B8-B0B5-0B0F032937A3@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jun 2012 22:18:58 -0700
Message-ID: <CAMKF1srZLzc7PAjN77HZ1QdDCNh7bVvJ6E04Dn90UroGWWuujg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openembedded] python_numpy: Fix SRC_URI warnings.
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
X-List-Received-Date: Fri, 22 Jun 2012 05:30:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 21, 2012 at 10:16 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
>
> That command returned empty.

:) thats what I expected.


