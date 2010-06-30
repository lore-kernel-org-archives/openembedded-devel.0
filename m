Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlcL-0002gv-N0
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:57:34 +0200
Received: by gyc15 with SMTP id 15so150551gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=EfBm+AkKjNdzeHmWJIlywKqZZHwyBLE3vdZkNWB7tr4=;
	b=xmAjDRJswfcqrcs0el7YtxTMKmDt7QHXu5xL28XEydqMaaYaXcMW1T8QlALxrB8cK2
	Vrs7LBfXWeoDtEFppiqnUt4H90svBP8oF/2PuijfPYsb3Q2TShM+7unIPnc5//lRMRa+
	yl/lbrjx6KBDPhqM8zGZviujI0lB2y50AL4ZA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=BwNVnmP0dvf6POM98xfdRVdfqKrAgWR1Y6mIDWUX4lWpJZn8ackswqaJgu0UWin37K
	u7kmdGOblMUDHmimg7mnPm+1NkXIAg6J8YU5Qws/AYopL5SYrFLAsgb7ulx9CbvLNB/s
	IJ6IhGxjzHHWmLVIIVnpuUbMJeHhkDepyc0SI=
Received: by 10.100.246.23 with SMTP id t23mr9461476anh.167.1277859169906;
	Tue, 29 Jun 2010 17:52:49 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id k11sm55661196ani.10.2010.06.29.17.52.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:52:48 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:52:37 -0300
Message-Id: <1277859158-28315-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Add unifdef to kernel 2.6.22
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
X-List-Received-Date: Wed, 30 Jun 2010 00:57:34 -0000

[PATCH] add unifdef to kernel 2.6.22

Thanks


