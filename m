Received: from na3sys009aog109.obsmtp.com ([74.125.149.201])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robertcasanova@nanometrics.ca>) id 1RazVo-0000xe-AZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 01:49:28 +0100
Received: from mail-vw0-f51.google.com ([209.85.212.51]) (using TLSv1) by
	na3sys009aob109.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTulCeBmXFV2N0DQ2BNI/u7wojNM3ZZUH@postini.com;
	Wed, 14 Dec 2011 16:42:33 PST
Received: by mail-vw0-f51.google.com with SMTP id fp1so1510923vbb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2011 16:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=date:from:to:subject:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=IWyCUp55CNk9MpwFMXmw8y6w5RjVVrNUq83OYHsRFTs=;
	b=ZJ4SSsOIjfT8XhWjIcVK4KgMxbYZnrmrKr/qY9sUPszWr4rA8nFtzTYuDgByc42S8V
	zktKwK38qlyYMCZ8Zpc2xyK2P7LJTd9JhT71zq1GXynFDLw1ITKGbXvXXqbhYvuI0sDZ
	RsRQIiJ8HqJEFuSX9jqVkG5x4w2oLwyjECUY8=
Received: by 10.52.95.13 with SMTP id dg13mr5847964vdb.124.1323883347828;
	Wed, 14 Dec 2011 09:22:27 -0800 (PST)
Received: from robert-linuxworkstation.nanometrics.ca ([206.191.47.130])
	by mx.google.com with ESMTPS id dg8sm3037625vdb.4.2011.12.14.09.22.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Dec 2011 09:22:27 -0800 (PST)
Date: Wed, 14 Dec 2011 12:22:25 -0500
From: Robert Casanova <robertcasanova@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111214122225.21c780a1@robert-linuxworkstation.nanometrics.ca>
X-Mailer: Claws Mail 3.7.9 (GTK+ 2.24.6; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Maintenance branch 2011-03
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
X-List-Received-Date: Thu, 15 Dec 2011 00:49:28 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello Tom,

we have developed a few recipes for OpenEmbedded on top of the
2011-03-maintenance branch the architecture used is ARM. We would like
to send these recipes but not sure what is the maintenance policy for
that branch or what should be the right mailing list to post to.

Cheers,

Robert


