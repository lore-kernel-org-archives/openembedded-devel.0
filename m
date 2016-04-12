Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5DCD86FF9B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 10:56:45 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id o6so4360183qkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 03:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=08FmV+h08/9a3LtBWhLwPqpiq3dSD9KiJfx8SJbZ8uU=;
	b=D6+/AWkaTxHYtkKY88VNfuSngiIutOI3+o3142dLZlYrMsghkOd4RMeMX0YpIei7VZ
	C0yt+2qWKs8EBRI3ZwksVRvgdi2IDPpXlzfpYq5g+ov1Qt3D6JG0b0PuwjIN7MIVZ4H/
	D3sj459JNqWthtwIRbEDQg62nFFF2+JXcS8qm3hgI3z1SXqtROA5pUie0IsL3lJzT5yx
	zWlwG20F7VwxIMo765o+yd6Zbo1rywRQmUf3tQJenKPIg3sAJUS87LvZ3aehIxE4PjvK
	u1vI4JfTVqeia7Y7+Zh+fXllP7wYdSYrSv/XzN0Os+chvuNG41Zvu0Qw4kDg6X7wDaHO
	MwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:date:to:subject:user-agent;
	bh=08FmV+h08/9a3LtBWhLwPqpiq3dSD9KiJfx8SJbZ8uU=;
	b=G2cgB6xZBRLqkq6olBDKye0wHkPkSrYXh+42mSmufNqI1wb75bMQEEKRPh3HU+swve
	oB5EEKct5bcsibla7JUHdDZ5yCmgSVog2PDpla6Ta2kvtDpsXMj19gLIs4LrkJM9VL6S
	BBB67YXq1n6ulKAspMA8Sj/ErC7tBtdZGwpeKfjSXhhuvak/wsdqPG7VtBPTZsCpGY/m
	oINf/PGYHosRzjD9oQB+5OG7o+tygmE0odcmw7fqzpDuwSn1xQv+in4DlAVw9nQs3hD7
	ekY6DQLqKGgi9xn2qfNFBVSE7MoFxK6kk0kVTSdA/bg+R1ZukA1ItPiQIo90e8qPO9S/
	voNQ==
X-Gm-Message-State: AOPr4FWq+VzvN+NADf/GNWRpRQkObtLXn7rjv6vI6TgqesSHCOHvAK+1HFFHTh595jYIQA==
X-Received: by 10.55.221.8 with SMTP id n8mr2388767qki.50.1460458605259;
	Tue, 12 Apr 2016 03:56:45 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 130sm6868942qki.6.2016.04.12.03.56.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Apr 2016 03:56:43 -0700 (PDT)
Message-ID: <570cd46b.8808370a.6f892.ffffcb20@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Tue, 12 Apr 2016 07:56:39 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Tue, 12 Apr 2016 07:56:39 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.8
Subject: Updates to meta-browser (master) in 2016-04-12
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
X-List-Received-Date: Tue, 12 Apr 2016 10:56:45 -0000

Hello,

I pushed following updates:

commit a67a3461a135668dba573183f0f62fcd5dfb3121 (HEAD -> pending, origin/master, origin/HEAD)
Author: Ian Coolidge <ian@boundarydevices.com>
Date:   Mon Apr 11 18:00:00 2016 -0700

    firefox: Fix QA Issue: non debug package contains .debug directory
    
    Signed-off-by: Ian Coolidge <ian@boundarydevices.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

