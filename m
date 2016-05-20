Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id F0BAE601A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2016 14:56:02 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id y126so32497162qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2016 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=wF1ucSkJ6L3gc3A6VSz8g6TDs2ZYZbpVjPysKkM0ytk=;
	b=zf/Bx15/EdyzBqH4yrjXNs3rDgH1CbPtkpwivIrXQN3c1doil9oQfCgQz9GlnlH96f
	gZdT+ITuOUsrHgKJj6ynhB3MsZoMIFMkgwGOabcLd8dMzlCNPdMYY4iAhskdQnAVXfNj
	q0pU3owkBiPZ2OJ5c99MFeCN3TkGC0vh1g2e1OPYoksROshHJ9S2dnDtCihiDysoHAw5
	fZo+K5nr+YjCACik9m1y8hXy4jGOWjvnZsDsHSh0ery5Ymzeyly6Edom2OuDwLzpJHNa
	9qlgSzEHHeNLr3hzPI+EFgMbhtz8CdjnRnbIdUpXdFZvWBQNJpPIsBiRZziSxOcy78ow
	3Vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:date:to:subject:user-agent;
	bh=wF1ucSkJ6L3gc3A6VSz8g6TDs2ZYZbpVjPysKkM0ytk=;
	b=YHVk2yCc6YvKlIvuhEg81PzgwAwpzrEBqrrCxBfa/yop1pggF++0gq7ajtCYOWFj9l
	iM/J6N3m2aFzw092weubK0eI4wQ4vaoWSVh3jCksrWqo2UMAoZ/iXU2rHBVbmghOrtZM
	v0Y0DHKFsOSooW4Tc3AaOADjNXFlDQg0BC1KY1GwkeN/HRZ4MYugEqG5wLlQOXCfbM+8
	HR4ykPh5fjljP56WiHTyXaJAwC8Qwz0OOzp1BoLa26ECGBPNLY0thT70Qj0h74lV8LXc
	GaHZTaPHEsdwDEIS5F92jSnGBwQiMkRIoJM15sO0qrvrwNySt6264vxYPusUlbIuxute
	iyHA==
X-Gm-Message-State: AOPr4FU1WCgn/g2JAs9CkHm0ep24FRGSF4RNewwrf2B2gyJYp3+LnHe+A/qT112HQu3Qew==
X-Received: by 10.55.117.151 with SMTP id q145mr3944413qkc.192.1463756162790; 
	Fri, 20 May 2016 07:56:02 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 77sm8970463qgn.29.2016.05.20.07.55.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 May 2016 07:56:01 -0700 (PDT)
Message-ID: <573f2581.d3168c0a.a7019.44b4@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Fri, 20 May 2016 11:55:55 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Fri, 20 May 2016 11:55:55 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.8
Subject: Updates to meta-browser (master) in 2016-05-20
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 May 2016 14:56:04 -0000

Hello,

I pushed following updates:

commit 825ea9349fe9b7da39f1de0c3e8e15d9d62f2774 (HEAD -> pending, origin/master, origin/HEAD)
Author: Carlos Rafael Giani <dv@pseudoterminal.org>
Date:   Fri May 20 13:41:47 2016 +0200

    chromium: Add workarounds for compiler errors
    
    Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

