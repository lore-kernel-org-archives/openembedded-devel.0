Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmfQ-00054r-JT
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:37:40 +0100
Received: by mail-da0-f42.google.com with SMTP id z17so8225758dal.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Iw2GKICw54uJW2tyZhppc32Ilek/DohXkmF4tevr828=;
	b=IE5xzOs/FlXsFxzXgC2rHfLCvMILZJU+5GWzB0Tm7FqWQNlsZLuYblqscjF66ZXTzw
	0INx+RWp5e22MPXG89hD6NrsQ23m3iGwyinwli5rko6CeY9LTtyav3KwDRtEAEXKsHve
	GwRJUqaeNlcjbSHfvdhnhGxI67fxMvA3ttNduvyiazjlz8FBy/Rt4y+TLpfVPOp0KcBf
	AzIvaMOPrIX9IlXZ4a1Z40sAGYbVCLOyIvZNbp4Hrtzqw5FbqeU6PUuCI8R1YQSVkZAz
	MF8ZimiyQCdsDi/QZHv89kgeZbkKoUpPl4iRMZBR0GCs1fDDyKwaWz5/b1h151k0siaP
	ebfA==
X-Received: by 10.66.85.70 with SMTP id f6mr159586009paz.76.1357463637888;
	Sun, 06 Jan 2013 01:13:57 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:48 -0800
Message-Id: <1357463568-26241-25-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V2 25/25] meta-systemd/atftpd: Adjust bbappend to match to recipe upgrade
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
X-List-Received-Date: Sun, 06 Jan 2013 09:37:53 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{atftp_0.7.bbappend => atftp_git.bbappend}     |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/meta-oe/recipes-extended/atftp/{atftp_0.7.bbappend => atftp_git.bbappend} (100%)

diff --git a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_0.7.bbappend b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/atftp/atftp_0.7.bbappend
rename to meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
-- 
1.7.9.5



