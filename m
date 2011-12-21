Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vitperov@gmail.com>) id 1RdQiv-0001Fi-3O
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 19:17:05 +0100
Received: by obcwn6 with SMTP id wn6so3553163obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 10:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=P/jKxDpRQv6SF/Rfdw/RFQzZszlcURxeBmeuMVKiK6E=;
	b=c84dNn2BnYb1ccVCxggUU+LlMhhbNgMX62YjvGx4pOJEwGJdAzbGA0pnirua4/sKaU
	SGVLWNkk+cvN1hysdZ9R7CyFZMIOrYwjmjcn0XXYsAQGekFEvCUB/RpTSo/odnw8gsp5
	TabNtLwyed+ycq8NbDTRcfly8i/KQr/mReCzU=
MIME-Version: 1.0
Received: by 10.182.13.42 with SMTP id e10mr6572325obc.18.1324490992637; Wed,
	21 Dec 2011 10:09:52 -0800 (PST)
Received: by 10.182.197.9 with HTTP; Wed, 21 Dec 2011 10:09:52 -0800 (PST)
Date: Wed, 21 Dec 2011 21:09:52 +0300
Message-ID: <CAKT91Vw=P_w0S+vSh3rpkcT-uL7e_23sPSKY_Bwa8jdLJF0ZeQ@mail.gmail.com>
From: Vit <vitperov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Please, review my patch
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
X-List-Received-Date: Wed, 21 Dec 2011 18:17:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Please, review my patch:

[v3] ftplib: add initial recipe with version 3.1 	
2011-12-15
Vitaly Perov


