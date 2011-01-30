Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pmiscml@gmail.com>) id 1PjLAO-0003Rg-HB
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Jan 2011 01:29:20 +0100
Received: by fxm17 with SMTP id 17so4593502fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 16:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	bh=Ud0jKtqXF1zZhK3C0dKyYwOAbyNytCU+0zvufHuA1zE=;
	b=ACRabntuf3C+NIOGu3wxMpF7ESeKbk+bAu0sLxSQqZKg4PCt6cSN94m3eQ+ucaNajS
	XU/MriR9ZflRmx1bUCzDshWSA0tJhISj2asASl8S0g/yGk6QZMkFQQCwsQEU3RUEpaoC
	6qPZBLA/9+effKhJ6O4fRalKeI8g2oajiOZqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=vRilRD56RQB18pOyLl3Gmyfd606LGwzo8ZiTEGLjffelwePa6aJPadiKEqifk0M3zq
	Ds+cmThACZtPYUPbssrlRShbzXrwT+FnV1IpAxieymF1g7mnzIcpjeEV70aqlLAAz6jy
	VjqigGfY1MxhD5Xe0ywgRQoIFY/Pvg7FYJzzg=
Received: by 10.223.85.204 with SMTP id p12mr4171961fal.146.1296347307595;
	Sat, 29 Jan 2011 16:28:27 -0800 (PST)
Received: from widy.localdomain ([213.238.9.13])
	by mx.google.com with ESMTPS id f24sm6896120fak.24.2011.01.29.16.28.26
	(version=SSLv3 cipher=RC4-MD5); Sat, 29 Jan 2011 16:28:27 -0800 (PST)
Date: Sun, 30 Jan 2011 02:28:18 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20110130022818.1c15662c@widy.localdomain>
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Official git mirror on github/gitorious?
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
X-List-Received-Date: Sun, 30 Jan 2011 00:29:20 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

Searching for "openembedded" on both github and gitorious give quite a
few hits:

http://github.com/search?langOverride=&q=openembedded&repo=&start_value=1&type=Repositories
http://gitorious.org/search?q=openembedded

Was there a thought to provide official mirrors on both (or one)
services for the purpose of accounting forks?

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


