Return-Path: <petr.nechaev@cogentembedded.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9D47772371
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 13:27:15 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w7so8553953lbi.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 05:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=lmeoCqxq9aunYgL7Pkx2D+e6Oo/INbTOYOPFJnk/gHs=;
	b=F7dt73lLYjqFhIyS69Iw9n1hyB3U7i1B0cq8IaV7QMqkLX6f80Y0lKJNvOtsySu3OH
	s25+HpJxC00tdfNlNn8JOsfqNU7gFokcT16UIXJAIg2E8eEqCn1CAdQxCuQZF0fTHpK+
	GTiUIIlHkA2f1G9KetufdgPcJ2OppS/YRvvuCOeVnbuIJt7lILex191BTBLiRWYq07u3
	b0/DEmpPsyojQ/434wMYvKBPb/qDmfo9HlG/Ww5N/PLDkpxvyokM3kmbckBUxFF7hMs9
	/aAbu1Vg6LQoaZE00Jn9M24jQ5WMZVmK6IkwAd5UQrfftXawKwlTlYr+joL7F8CnLi4i
	hH8Q==
X-Gm-Message-State: ALoCoQmGPZdbAMnyg16lBbhsPMUVjW7XDrG5xrYDJk7MqobTHmjWiTUlL407mzn7HMEilTIkacKQ
MIME-Version: 1.0
X-Received: by 10.152.19.71 with SMTP id c7mr26340456lae.79.1417440435757;
	Mon, 01 Dec 2014 05:27:15 -0800 (PST)
Received: by 10.25.23.86 with HTTP; Mon, 1 Dec 2014 05:27:15 -0800 (PST)
In-Reply-To: <mailman.1269.1417437531.1406.openembedded-devel@lists.openembedded.org>
References: <mailman.1269.1417437531.1406.openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Dec 2014 17:27:15 +0400
Message-ID: <CAHPquwN5-Zy9=9rjZ-ktxibXX8VepN19qqu2JFRbkKMMsP_1fw@mail.gmail.com>
From: Petr Nechaev <petr.nechaev@cogentembedded.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5][PATCH] Updated comments in qt5-versions.inc
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
X-List-Received-Date: Mon, 01 Dec 2014 13:27:24 -0000
X-Groupsio-MsgNum: 53124
Content-Type: multipart/mixed; boundary=089e01494302aa9e0705092791d0

--089e01494302aa9e0705092791d0
Content-Type: text/plain; charset=UTF-8

Updated comments to avoid confusion

---------- Forwarded message ----------
From: <openembedded-devel-owner@lists.openembedded.org>
Date: Mon, Dec 1, 2014 at 3:38 PM
Subject: [meta-qt5][PATCH] Updated comments in qt5-versions.inc
To: petr.nechaev@cogentembedded.com


Only members may post to the list. Please subscribe and post again.



---------- Forwarded message ----------
From: Petr Nechaev <petr.nechaev@cogentembedded.com>
To: openembedded-devel@lists.openembedded.org
Cc: Petr Nechaev <petr.nechaev@cogentembedded.com>
Date: Mon, 1 Dec 2014 16:38:48 +0400
Subject: [meta-qt5][PATCH] Updated comments in qt5-versions.inc
Updated comments to avoid confusion

---
Petr

--089e01494302aa9e0705092791d0
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-Updated-comments-in-qt5-versions.inc.patch"
Content-Disposition: attachment; 
	filename="0001-Updated-comments-in-qt5-versions.inc.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i35tkek10

RnJvbSAyMTViODFkMzFhOWY3OGE2ZGEzZWUyYWUwNzBkM2I4MmJkYjVlYTQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQZXRyIE5lY2hhZXYgPHBldHIubmVjaGFldkBjb2dlbnRlbWJl
ZGRlZC5jb20+CkRhdGU6IE1vbiwgMSBEZWMgMjAxNCAxNToyODozNCArMDMwMApTdWJqZWN0OiBb
bWV0YS1xdDVdW1BBVENIXSBVcGRhdGVkIGNvbW1lbnRzIGluIHF0NS12ZXJzaW9ucy5pbmMKCi0t
LQogY29uZi9kaXN0cm8vaW5jbHVkZS9xdDUtdmVyc2lvbnMuaW5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvY29uZi9k
aXN0cm8vaW5jbHVkZS9xdDUtdmVyc2lvbnMuaW5jIGIvY29uZi9kaXN0cm8vaW5jbHVkZS9xdDUt
dmVyc2lvbnMuaW5jCmluZGV4IDc1MzBhMjQuLjcxZWNlOTQgMTAwNjQ0Ci0tLSBhL2NvbmYvZGlz
dHJvL2luY2x1ZGUvcXQ1LXZlcnNpb25zLmluYworKysgYi9jb25mL2Rpc3Ryby9pbmNsdWRlL3F0
NS12ZXJzaW9ucy5pbmMKQEAgLTEsNSArMSw1IEBACiAjIFNlbGVjdCB3aGljaCB2ZXJzaW9uIHlv
dSBwcmVmZXIgYnkgZGVmaW5pbmcgUVQ1X1ZFUlNJT04gYW5kIGluY2x1ZGluZyB0aGlzIGZpbGUK
LSMgcG9zc2libGUgdmFsdWVzIG5vdyAiNS4zLjIiLCAiNS4zLjArNS40LjAtYWxwaGExK2dpdCIK
KyMgcG9zc2libGUgdmFsdWVzIG5vdyAiNS4zLjIiLCAiNS4zLjArNS40LjAtcmMxK2dpdCIKIAog
UVQ1X1ZFUlNJT04gPz0gIjUuMy4yIgogCi0tIAoxLjkuMwoK

--089e01494302aa9e0705092791d0--
