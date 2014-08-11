Return-Path: <sledz@dresearch-fe.de>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 33732609B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 13:23:33 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id x48so8614391wes.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 06:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:resent-from:resent-to:resent-date
	:resent-message-id:resent-user-agent:message-id:date:from:user-agent
	:mime-version:to:subject:content-type:content-transfer-encoding;
	bh=yqaRMdnrgW6LtaTILcKLxqKAj1DQgsDDpLeRpcfbP3w=;
	b=EwA4bG0lS72ZAl3khZnewhKJtgicx/id9fA5S56QW+t1DTompY/5eo1SSwdQkpLfAn
	wUw/8+UHrPA94NGL8FuEaUTc3H2ezdHwzYV01aMb94yhcoMiH0nAaRxAfXPUvfJMale/
	fHBhkdVT9EJhWU9ZNzDaeVS8ge12kgivwjh+BaZFKLqsFLJnOS3hW4E1sp5i85OQ1rq3
	0Lmiid11Q2bwoh8NxpV8XDdeiZrQq7nRiLI6ncIj7zO5jX/ThMx7NZ4gBnU0NltS/Gr9
	2gqI8JifY9bZG0O+SmHB2cDzN34V81njJtpIOq6RHomd4DIaqgY7upMruf825+LSnplO
	tyTQ==
X-Gm-Message-State: ALoCoQk2GI/Um/0j41wnZqrYckIXhz+7qUwoe/T6X8WOkbg0ikVYdukaexeoNNUV3BNRXVG9X9kX
X-Received: by 10.194.188.46 with SMTP id fx14mr11472244wjc.112.1407763413922; 
	Mon, 11 Aug 2014 06:23:33 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id z5sm1534362wje.49.2014.08.11.06.23.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Aug 2014 06:23:33 -0700 (PDT)
Resent-From: Steffen Sledz <sledz@dresearch-fe.de>
Resent-To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Resent-Date: Mon, 11 Aug 2014 15:23:32 +0200
Resent-Message-ID: <53E8C3D4.5020400@dresearch-fe.de>
Resent-User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id fe5sm301187wjc.12.2014.08.11.02.53.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Aug 2014 02:53:12 -0700 (PDT)
Message-ID: <53E89286.7050303@dresearch-fe.de>
Date: Mon, 11 Aug 2014 11:53:10 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Ralink RT3572/RT5572?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Aug 2014 13:23:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Are the linux kernel modules for Ralink WiFi-USB devices with RT3572 and/or RT5572 (available from <http://www.mediatek.com/en/downloads/>) still integrated in an OE-Layer?

If not, what would be the right place for them (openembedded-core, meta-networking, or something else)?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

