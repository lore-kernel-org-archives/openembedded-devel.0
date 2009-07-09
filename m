Received: from [209.85.210.193] (helo=mail-yx0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MOtcv-0004a6-Mm
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 15:25:41 +0200
Received: by yxe31 with SMTP id 31so190156yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2009 06:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=f9IajWs9KS+MHrH2hi6uoBvbxLlaKrvCvFHGbelyD9k=;
	b=hsnKn0efeaQjyocGelhhW3Z2mjRdBojqo0G+0Zp9pNk5afbZxPSxIbchGMw9L1hKjm
	aFGXVXDCkb08JgyD9AwW7TCoQFkqg0qAtPKkBfifEkZZ4CamoOIuWFXPOkGkgsp3KsDq
	tSpW+hBOEGERVZpqjmlxR+U2dgThXVcKXYM/0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=vaP+5omCZAAanT6uaqPHCCe56936CWAZ0SJqNOzgOg6XFL9r2esJqGvEeWWzISde0W
	bLsEYeSeXEHcMYiefakiUk1i7n229lEhQPgZ6JVaLF+eOTi0z9DKcXxTcDGu8JQ4LE70
	vzC76U07v0nVt+h6nVTokPgLqnhD1DQ+zOls4=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.212.16 with SMTP id k16mr1005434ang.184.1247145161830; 
	Thu, 09 Jul 2009 06:12:41 -0700 (PDT)
Date: Thu, 9 Jul 2009 10:12:41 -0300
X-Google-Sender-Auth: 86d2c659a9a914af
Message-ID: <be7a9f3d0907090612k3babae30h64d0424a4fe8dcc0@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: [RFH] Stable qemu-native BROKEN
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
X-List-Received-Date: Thu, 09 Jul 2009 13:26:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

Last changes on stable has broken qemu and it doesn't compile anymore for me.

It would be nice i f someone could take a look at it  since it is
quite critical for stable.

Attached the log.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


