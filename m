Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tdnli-0002ah-F4
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 20:58:02 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so7481290pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 11:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=hBGqqv5xO79HfbjA0UgyOP/X421CcE3aAPYDAcwhvUI=;
	b=fxGKGGnvWDtkloOFSFR/hz1u8iC2LpLCasrhcCIiu91tDzHkvmfTsitj5b1i4iLc/N
	VfYYwvTnXjM//VSjJhYg7RDcKf1g4/uoQrELotJkSx6EvAgmp4/sH0qhMIy5+aqSEoE/
	Z3FkxrfnHa1DH3019wSKUmF1tW1cu1ZubWxn6vdfx7H/cePCwd1DULwM/ns/nCgdue8+
	bWZKDpsp8uKo4lHX05sXdRVBuSqLrGhK6ON2r6Ify06yQOltG4rVNsd1XYbCutj+cVRq
	DXraHla6cqTSd5RVtX/RwTB3ZZkYzFhx2X8EnhOuUmcL7eH3URSdyBPd7wBBCQjq30WH
	3oMA==
MIME-Version: 1.0
Received: by 10.68.234.98 with SMTP id ud2mr61470780pbc.136.1354131826855;
	Wed, 28 Nov 2012 11:43:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 28 Nov 2012 11:43:46 -0800 (PST)
In-Reply-To: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
References: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
Date: Wed, 28 Nov 2012 17:43:46 -0200
X-Google-Sender-Auth: FM_S_rjyc2hBiZw5wW8F64iCSEU
Message-ID: <CAP9ODKowoJ2onNhd4qO3Oxi+fXrnWAOz+DfSvLJg_zNpJ3Re1w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/6] freerdp: disable man pages generation
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
X-List-Received-Date: Wed, 28 Nov 2012 19:58:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 28, 2012 at 5:30 PM, Mario Domenech Goulart
<mario@ossystems.com.br> wrote:
> Man pages generation uses xmlto, and it seems that it is currently
> broken on OE.
>
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


